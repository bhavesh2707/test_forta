output "event_rule_arn" {
  value = aws_cloudwatch_event_rule.dynamodb_rule.arn
}

output "event_target_id" {
  value = aws_cloudwatch_event_target.sqs_target.target_id
}
