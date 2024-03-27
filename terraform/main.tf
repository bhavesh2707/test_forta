provider "aws" {
  region = var.region
}
module "eventbridge_dynamodb_sqs" {
  source = "./module/event"
  event_bus_name    = var.event_bus_name
  rule_name         = var.rule_name
  dynamodb_table_arn = var.dynamodb_table_arn
  sqs_queue_arn     = var.sqs_queue_arn
}
