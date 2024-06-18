resource "aws_iam_role" "tenant" {
  name = "cc-ss-${var.tenant}-${var.service}-${var.env}"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRoleWithWebIdentity"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Federated : "*"
        }
        Condition = {
          StringLike = {
            "token.actions.githubusercontent.com:sub:" : var.tenant_github_repo
            "sts:RoleSessionName" : "GitHubActions"
          }
          StringEquals = {
            "token.actions.githubusercontent.com:aud:" : "sts.amazonaws.com"
          }
        },
      }
    ]
  })

  tags = {
    Tenant       = var.tenant
    Service      = var.service
    Env          = var.env
    CostCenter   = var.cost_center
    ServiceOwner = var.service_owner
  }
}

resource "aws_iam_role_policy_attachment" "default" {
  policy_arn = aws_iam_policy.default.arn
  role       = aws_iam_role.tenant.name
}

resource "aws_iam_policy" "default" {
  policy = data.aws_iam_policy_document.default.json
}

data "aws_iam_policy_document" "default" {
  statement {
    sid = "WriteToBucket"

    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.default.id}",
      "arn:aws:s3:::${aws_s3_bucket.default.id}/*"
    ]
  }
}