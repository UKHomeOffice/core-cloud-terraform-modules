resource "aws_cloudwatch_log_destination" "cw_logs_destination" {
  name       = var.destination_name
  role_arn   = aws_iam_role.logs_destination_role.arn
  target_arn = var.firehose_arn
}

resource "aws_cloudwatch_log_destination_policy" "cw_logs_destination_policy" {
  destination_name = aws_cloudwatch_log_destination.cw_logs_destination.name
  access_policy    = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          AWS = var.source_account_id
        }
        Action   = "logs:PutSubscriptionFilter"
        Resource = aws_cloudwatch_log_destination.cw_logs_destination.arn
      }
    ]
  })
}

resource "aws_iam_role" "logs_destination_role" {
  name = "CloudWatchLogsDestinationRole"

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
