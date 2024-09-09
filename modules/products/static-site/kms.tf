resource "aws_kms_key" "static_site_kms" {
  enable_key_rotation = true
  tags                = local.common_tags
}


resource "aws_kms_key_policy" "static_site_kms_policy" {  
  key_id = aws_kms_key.static_site_kms.id  
  policy = jsonencode({
    Version = "2012-10-17"
    Id = "static_site_kms_policy"
    Statement = [
      {
        Sid      = "StaticSiteKmsPolicy"
        Action   = "kms:*"
        Effect   = "Allow"
        Principal = {
          AWS = "arn:aws:iam::${local.account_id}:root"
        }
        Resource = ["*"]     
      },
    ]
    Statement = [
      {
        Sid      = "CloudFrontServiceKmsPolicy"
        Action = [
          "kms:Decrypt",
          "kms:Encrypt",
          "kms:GenerateDataKey*"
        ]
        Effect = "Allow"
        Principal = {
          type        = "Service"
          identifiers = ["cloudfront.amazonaws.com"]
        }
        Resource = ["*"]  
        condition = {
            test     = "StringEquals"
            variable = "aws:SourceArn"
            values   = [aws_cloudfront_distribution.static_site_distribution.arn]
          }
      },
    ]    
  })
}