resource "aws_kms_key" "static_site_kms" {
  enable_key_rotation = true
  tags                = local.common_tags
}


resource "aws_kms_key_policy" "static_site_kms_policy" {
key_id = aws_kms_key.static_site_kms.id
  policy = jsonencode({
    "Version": "2012-10-17",
    "Id": "static_site_kms_policy",
    "Statement": [
        {
            "Sid": "EnableIAMUserPermissions",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${local.account_id}:root"
            },
            "Action": "kms:*",
            "Resource": "*"
        },
        {
            "Sid": "CloudFrontServiceKmsPolicyKey",
            "Effect": "Allow",
            "Principal": {
                "Service": "cloudfront.amazonaws.com"
            },
            "Action": [
                "kms:Decrypt",
                "kms:Encrypt",
                "kms:GenerateDataKey*"
            ],
            "Resource": "*",
            "Condition": {
                "StringEquals": {
                    "aws:SourceArn": "aws_cloudfront_distribution.static_site_distribution.arn"
                }
            }
        }
    ]
})
}

resource "aws_kms_alias" "static_site_kms_alias" {
  name_prefix         = "alias/accelerator/kms/static_site/key/"
  target_key_id = aws_kms_key.static_site_kms.key_id
}

