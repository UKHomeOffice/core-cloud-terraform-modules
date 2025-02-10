
resource "aws_iam_role" "api_gateway_role" {
  name = "api-gateway-dynamodb-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "apigateway.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "api_gateway_dynamodb_policy" {
  name        = "api-gateway-dynamodb-policy"
  description = "Allows API Gateway to write to DynamoDB"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["dynamodb:PutItem"]
      Resource = [
        "arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${var.dynamodb_table_name}",
        "arn:aws:dynamodb:${var.aws_region}:${data.aws_caller_identity.current.account_id}:table/${var.dynamodb_table_name}/*"
      ]
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_api_gateway_policy" {
  policy_arn = aws_iam_policy.api_gateway_dynamodb_policy.arn
  role       = aws_iam_role.api_gateway_role.name
}

data "aws_caller_identity" "current" {}


