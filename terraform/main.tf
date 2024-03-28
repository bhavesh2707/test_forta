provider "aws_cloudformation_stack" {
  region = var.region
}
module "eventbridge_dynamodb_sqs" {
  source = "./module/event"
  event_bus_name    = var.event_bus_name
  rule_name         = var.rule_name
  dynamodb_table_arn = var.dynamodb_table_arn
  sqs_queue_arn     = var.sqs_queue_arn
  event_pipe_name = var.event_pipe_name
  role_arn = var.role_arn
}
