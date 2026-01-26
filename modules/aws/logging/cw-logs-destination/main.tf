locals {
  # Org-wide policy — allows any account in the organization to create subscription filters
  org_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "AllowOrgAccountsToSubscribe"
        Effect    = "Allow"
        Principal = "*"
        Action    = "logs:PutSubscriptionFilter"
        Resource  = aws_cloudwatch_log_destination.cw_logs_destination.arn
        Condition = {
          StringEquals = {
            "aws:PrincipalOrgID" = var.organization_id
          }
        }
      }
    ]
  })

  # Account-based policy (legacy) — allows specific account IDs only
  account_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          AWS = var.source_account_id
        }
        Action   = "logs:PutSubscriptionFilter"
        Resource = aws_cloudwatch_log_destination.cw_logs_destination.arn
      }
    ]
  })

  # Choose which policy to use
  access_policy = var.organization_id != null ? local.org_policy : local.account_policy
}

resource "aws_cloudwatch_log_destination" "cw_logs_destination" {
  name       = var.destination_name
  role_arn   = aws_iam_role.logs_destination_role.arn
  target_arn = var.firehose_arn
  tags       = var.tags
}

resource "aws_cloudwatch_log_destination_policy" "cw_logs_destination_policy" {
  destination_name = aws_cloudwatch_log_destination.cw_logs_destination.name
  access_policy    = local.access_policy
}

resource "aws_iam_role" "logs_destination_role" {
  name = "CloudWatchLogsDestinationRole"
  tags = var.tags

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "logs.${var.aws_region}.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "logs_destination_policy" {
  role = aws_iam_role.logs_destination_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "firehose:PutRecord",
          "firehose:PutRecordBatch"
        ]
        Resource = var.firehose_arn
      }
    ]
  })
}
