data "aws_iam_policy_document" "deadletter_queue_standard" {
  count = length(keys(var.sqs_to_sns_mappings))

  statement {
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      "${aws_sqs_queue.deadletter_queue_standard.*.arn[count.index]}"
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        "${aws_sqs_queue.queue.*.arn[count.index]}"
      ]
    }
    sid = "AllowSQSToSQS"
  }
}

resource "aws_sqs_queue_policy" "deadletter_queue_standard" {
  count = length(keys(var.sqs_to_sns_mappings))

  queue_url = aws_sqs_queue.deadletter_queue_standard.*.id[count.index]
  policy    = data.aws_iam_policy_document.deadletter_queue_standard.*.json[count.index]
}

resource "aws_sqs_queue" "deadletter_queue_standard" {
  count = length(keys(var.sqs_to_sns_mappings))

  name                       = "${var.name_prefix}-${element(keys(var.sqs_to_sns_mappings), count.index)}-deadletter${var.name_suffix}"
  visibility_timeout_seconds = var.deadletter_visibility_timeout_seconds
  delay_seconds              = var.deadletter_delay_seconds
  max_message_size           = var.deadletter_max_message_size
  message_retention_seconds  = var.deadletter_message_retention_seconds
  receive_wait_time_seconds  = var.deadletter_receive_wait_time_seconds

  tags = local.common_tags
}
