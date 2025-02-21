output "event_bus_arn" {
  description = "ARN of the created EventBridge Event-Bus"
  value       = length(aws_cloudwatch_event_bus.custom_event_bus) > 0 ? aws_cloudwatch_event_bus.custom_event_bus[0].arn : null
}

output "event_rule_arn" {
  description = "ARN of the created EventBridge rule"
  value       = aws_cloudwatch_event_rule.event_rule.arn
}

output "event_target_arn" {
  description = "ARN of the EventBridge target"
  value       = aws_cloudwatch_event_target.event_target.arn
}

output "iam_role_arn" {
  description = "ARN of the IAM role used by EventBridge"
  value       = aws_iam_role.eventbridge_role.arn
}

