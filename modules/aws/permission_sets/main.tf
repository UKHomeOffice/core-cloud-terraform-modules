terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.39.0"
    }
  }
}

resource "aws_ssoadmin_permission_set" "identity_store_permission_set" {
  name = var.name
  description = var.description
  instance_arn = var.identity_store_arn
}

data "aws_iam_policy_document" "iam_policy_document" {
  dynamic "statement" {
    for_each = var.inline_policies

    content {
      sid       = try(statement.value.sid, null)
      actions   = statement.value.actions
      resources = statement.value.resources
    }
  }
}

resource "aws_ssoadmin_permission_set_inline_policy" "permission_set_inline_policy" {
  inline_policy      = data.aws_iam_policy_document.iam_policy_document.json
  instance_arn       = var.identity_store_arn
  permission_set_arn = aws_ssoadmin_permission_set.identity_store_permission_set.arn
}
