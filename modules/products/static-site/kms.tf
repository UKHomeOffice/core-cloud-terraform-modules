resource "aws_kms_key" "static_site_kms" {
  enable_key_rotation = true
  tags                = local.common_tags
}

resource "aws_kms_key_policy" "static_site_kms_policy" {
  key_id = aws_kms_key.static_site_kms.id
  policy = jsonencode({
    Version = "2012-10-17"
    Id      = "static_site_kms_policy"
    Statement = [
      {
        Sid    = "EnableIAMUserPermissions"
        Action = "kms:*"
        Effect = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${local.account_id}:root"
        }
        Resource = ["*"]
      },
    ]  
   })
}

