resource "aws_cloudwatch_event_rule" "dynamodb_rule" {
  name          = var.rule_name
  event_bus_name = var.event_bus_name
  event_pattern = jsonencode({
    "source": ["aws.dynamodb"],
    "detail": {
      "eventSource": ["dynamodb.amazonaws.com"],
      "eventName": ["UpdateItem", "PutItem", "DeleteItem"],
      "requestParameters": {
        "tableName": [var.dynamodb_table_arn]
      }
    }
  })
}
resource "aws_cloudwatch_event_target" "sqs_target" {
  rule     = aws_cloudwatch_event_rule.dynamodb_rule.name
  arn      = var.sqs_queue_arn
  target_id = "sqs-target"
}
