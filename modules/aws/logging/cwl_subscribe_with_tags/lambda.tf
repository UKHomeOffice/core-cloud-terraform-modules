data "archive_file" "this" {
  type        = "zip"
  output_path = "${path.module}/create-sub-filter.zip"
  source_file = "create-sub-filter/main.py"
}

resource "aws_lambda_function" "this" {
  filename         = data.archive_file.this.output_path
  source_code_hash = data.archive_file.this.output_base64sha256
  function_name    = var.name
  description      = "Creates a subscription filter when an opt-in tag value is found."
  role             = aws_iam_role.lambda.arn

  package_type                   = "Zip"
  handler                        = "main.handler"
  runtime                        = "python3.9"
  reserved_concurrent_executions = -1
  timeout                        = 180
  memory_size                    = 768
  tracing_config {
    mode = "Active"
  }

  environment {
    variables = {
      DESTINATION_ARN = var.cloudwatch_logs_destination_arn
      ROLE_ARN        = aws_iam_role.lambda_code.arn
      ACCOUNT_ID      = data.aws_caller_identity.current.account_id

      FILTER_NAME = var.name
      REGION      = data.aws_region.current.name
      TAG         = var.tag_pattern
      OPT_IN      = var.opt_in_tag_value
      OPT_OUT     = var.opt_out_tag_value
    }
  }
}

resource "aws_lambda_permission" "this" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.this.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.this.arn
}

resource "aws_iam_role" "lambda" {
  name               = "${var.name}-lambda-function"
  description        = "Role that is assumed by ${var.name} lambda."
  assume_role_policy = data.aws_iam_policy_document.lambda-assume.json
}

data "aws_iam_policy_document" "lambda-assume" {
  statement {
    effect = "Allow"

    principals {
      type = "Service"
      identifiers = [
        "lambda.amazonaws.com"
      ]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values = [
        data.aws_caller_identity.current.account_id
      ]
    }
  }
}

#tfsec:ignore:aws-cloudwatch-log-group-customer-key
resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/lambda/${var.name}"
  retention_in_days = var.log_retention_in_days
  kms_key_id        = var.kms_key
}

resource "aws_iam_role_policy_attachment" "lambda" {
  role       = aws_iam_role.lambda.id
  policy_arn = aws_iam_policy.lambda.arn
}

resource "aws_iam_policy" "lambda" {
  name   = "${var.name}-lambda-function"
  policy = data.aws_iam_policy_document.lambda.json
}

data "aws_iam_policy_document" "lambda" {
  statement {
    effect = "Allow"
    actions = [
      "logs:PutSubscriptionFilter",
      "logs:DeleteSubscriptionFilter",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]

    resources = [
      "arn:aws:logs:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:*"
    ]
  }
}

resource "aws_iam_role" "lambda_code" {
  name = "${var.name}-lambda-code"

  assume_role_policy = data.aws_iam_policy_document.lambda_code_assume.json
}

data "aws_iam_policy_document" "lambda_code_assume" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = [
        "logs.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_role_policy_attachment" "lambda_code" {
  role       = aws_iam_role.lambda_code.id
  policy_arn = aws_iam_policy.lambda_code.arn
}

resource "aws_iam_policy" "lambda_code" {
  name   = "${var.name}-lambda-code"
  policy = data.aws_iam_policy_document.lambda_code.json
}

data "aws_iam_policy_document" "lambda_code" {
  statement {
    effect = "Allow"
    actions = [
      "logs:PutSubscriptionFilter"
    ]

    # tfsec:ignore:aws-iam-no-policy-wildcards
    resources = [
      "*"
    ]
  }
}
