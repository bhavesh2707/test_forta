variable "event_bus_name" {
  description = "Name the EventBridge event bus"
  type        = string
}

variable "rule_name" {
  description = "Name the EventBridge rule"
  type        = string
}

variable "dynamodb_table_arn" {
  description = "ARN the DynamoDB table"
  type        = string
}

variable "sqs_queue_arn" {
  description = "ARN the SQS queue"
  type        = string
}

variable "event_pipe_name" {
  description = "Name the eventpipe"
  type = string
}

variable "role_arn" {
  description = "Enter the IAM role arn"
  type = string
}