terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.81.0"
    }
  }
}
# Create EventBridge event-bus - if required
resource "aws_cloudwatch_event_bus" "custom_event_bus" {
  count = var.create_event_bus ? 1 : 0
  name  = var.event_bus_name
}

data "aws_iam_policy_document" "this" {
  count = var.source_event_bus_arn == "" ? 0 : 1
  statement {
    sid    = "ActionsForResource"
    effect = "Allow"
    actions = [
      "events:PutEvents"
    ],
    resources = [
      var.source_event_bus_arn
    ]
  }
}

resource "aws_cloudwatch_event_bus_policy" "this" {
  count          = var.source_event_bus_arn == "" ? 0 : 1
  event_bus_name = aws_cloudwatch_event_bus.custom_event_bus[0].name
  policy         = data.aws_iam_policy_document.this[0].json
}

resource "aws_cloudwatch_event_rule" "event_rule" {
  name           = var.event_rule_name
  description    = var.event_rule_description
  event_bus_name = var.event_bus_name
  event_pattern = jsonencode({
    source = var.event_sources
  })
  depends_on = [aws_cloudwatch_event_bus.custom_event_bus]
}

resource "aws_cloudwatch_event_target" "event_target" {
  rule           = aws_cloudwatch_event_rule.event_rule.name
  event_bus_name = var.event_bus_name
  arn            = var.target_arn
  role_arn       = aws_iam_role.eventbridge_role.arn
}

resource "aws_iam_role" "eventbridge_role" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow"
        Principal = { Service = "events.amazonaws.com" }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy" "eventbridge_policy" {
  role = aws_iam_role.eventbridge_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow"
        Action   = var.role_actions
        Resource = var.target_arn
      }
    ]
  })
}
