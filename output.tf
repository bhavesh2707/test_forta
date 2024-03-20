output "forta_sqs_queue_name" {
  description = "The name of the created SQS FIFO queue"
  value       = aws_sqs_queue.forta_sqs_queue.name
}

output "forta_sqs_queue_id" {
  description = "The ID of the created SQS FIFO queue"
  value       = aws_sqs_queue.forta_sqs_queue.id
}