data "aws_iam_policy_document" "queue" {
  count = length(keys(var.sqs_to_sns_mappings))

  statement {
    actions = [
      "sqs:SendMessage"
    ]
    resources = [
      aws_sqs_queue.queue[*].arn[count.index]
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    condition {
      test     = "ArnEquals"
      variable = "aws:SourceArn"
      values = [
        element(values(var.sqs_to_sns_mappings), count.index)
      ]
    }
    sid = "AllowSNSToSQS"
  }
}

resource "aws_sqs_queue_policy" "queue" {
  count = length(keys(var.sqs_to_sns_mappings))

  queue_url = aws_sqs_queue.queue[*].id[count.index]
  policy    = data.aws_iam_policy_document.queue[*].json[count.index]
}

resource "aws_sqs_queue" "queue" {
  count = length(keys(var.sqs_to_sns_mappings))

  name                       = "${var.name_prefix}-${element(keys(var.sqs_to_sns_mappings), count.index)}${var.name_suffix}"
  kms_master_key_id          = aws_kms_key.this.id
  visibility_timeout_seconds = var.visibility_timeout_seconds
  delay_seconds              = var.delay_seconds
  max_message_size           = var.max_message_size
  message_retention_seconds  = var.message_retention_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  redrive_policy             = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.deadletter_queue_standard[*].arn[count.index]}\",\"maxReceiveCount\":${var.queue_redrive_max_submissions_before_deadletter}}"

  tags = local.common_tags
}
