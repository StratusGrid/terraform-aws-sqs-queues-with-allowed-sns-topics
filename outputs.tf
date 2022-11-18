output "sqs_queue_arns" {
  description = "ARN for SQS queue"
  value       = aws_sqs_queue.queue[*].arn
}

output "sqs_queue_deadletter_arns" {
  description = "ARN for SQS deadletter"
  value       = aws_sqs_queue.deadletter_queue_standard[*].arn
}