output "sqs_queue_arns" {
  value = aws_sqs_queue.queue.*.arn
}

output "sqs_queue_deadletter_arns" {
  value = aws_sqs_queue.deadletter_queue_standard.*.arn
}