resource "aws_iam_role" "static_site_actions_push" {
  name = "cc-static-site-${var.product}-${var.component}"
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
            "token.actions.githubusercontent.com:sub:" : var.repository
            "sts:RoleSessionName" : "GitHubActions"
          }
          StringEquals = {
            "token.actions.githubusercontent.com:aud:" : "sts.amazonaws.com"
          }
        },
      }
    ]
  })

  tags = local.common_tags
}

resource "aws_iam_role_policy_attachment" "static_site_policy_attachment" {
  policy_arn = aws_iam_policy.static_site_policy.arn
  role       = aws_iam_role.static_site_actions_push.name
}

resource "aws_iam_policy" "static_site_policy" {
  policy = data.aws_iam_policy_document.static_site_policy_document.json
}

data "aws_iam_policy_document" "static_site_policy_document" {
  statement {
    sid = "WriteToBucket"

    actions = [
      "s3:PutObject",
      "s3:DeleteObject",
    ]

    resources = [
      "arn:aws:s3:::${aws_s3_bucket.static_site.id}",
      "arn:aws:s3:::${aws_s3_bucket.static_site.id}/*"
    ]
  }
}
