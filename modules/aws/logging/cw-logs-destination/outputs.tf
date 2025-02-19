output "cw_logs_destination_arn" {
  description = "The ARN of the CloudWatch Logs Destination"
  value       = aws_cloudwatch_log_destination.cw_logs_destination.arn
}
