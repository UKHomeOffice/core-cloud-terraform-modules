resource "aws_dynamodb_resource_policy" "this" {
  resource_arn                        = var.dynamodb_arn
  policy                              = var.dynamodb_resource_policy_json
  confirm_remove_self_resource_access = var.confirm_remove_self_resource_access
}
