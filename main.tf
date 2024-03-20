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
}