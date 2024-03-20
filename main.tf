resource "aws_sqs_queue" "forta_sqs_queue" {
  name                      = var.name
  fifo_queue                = true
  content_based_deduplication = true
  delay_seconds             = 0
  max_message_size         = 262144  
  message_retention_seconds = 345600 
  visibility_timeout_seconds = 30
  receive_wait_time_seconds = 20
  #deduplication_scope   = "messageGroup"
  #fifo_throughput_limit = "perMessageGroupId"
  redrive_policy = var.enabled ? jsonencode({
    deadLetterTargetArn = aws_sqs_queue.forta_sqs_dlq_queue.arn
    maxReceiveCount     = 4
  }) : {}
}

resource "aws_sqs_queue" "forta_sqs_dlq_queue" {
  name = var.name
  count = var.enabled ? 1 : 0
}

resource "aws_sqs_queue_redrive_allow_policy" "terraform_queue_redrive_allow_policy" {
  queue_url = aws_sqs_queue.forta_sqs_dlq_queue.id

  redrive_allow_policy = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.forta_sqs_queue.arn]
  })
}