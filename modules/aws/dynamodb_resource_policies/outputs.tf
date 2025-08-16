output "dynamodb_resource_policy_arn" {
  value = aws_dynamodb_resource_policy.this.resource_arn
}

output "revision_id" {
  value = aws_dynamodb_resource_policy.this.revision_id
}
