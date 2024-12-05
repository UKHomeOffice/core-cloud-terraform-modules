
# Create IAM users for SES credentials
resource "aws_iam_user" "ses_user" {
  count = length(var.ses_creds)

  name = var.ses_creds[count.index].name
}

# Create IAM access keys for SES users
resource "aws_iam_access_key" "ses_access_key" {
  count = length(var.ses_creds)

  user = aws_iam_user.ses_user[count.index].name
}

# Create Secrets Manager secret to store access keys
resource "aws_secretsmanager_secret" "ses_secret" {
  count = length(var.ses_creds)

  name        = "ses-credentials-${var.ses_creds[count.index].name}"
  description = "SES credentials for ${var.ses_creds[count.index].name}"

  tags = {
    "Environment" = "production"
  }
}

# Store the IAM access key and secret access key in Secrets Manager
resource "aws_secretsmanager_secret_version" "ses_secret_version" {
  count = length(var.ses_creds)

  secret_id     = aws_secretsmanager_secret.ses_secret[count.index].id
  secret_string = jsonencode({
    access_key_id     = aws_iam_access_key.ses_access_key[count.index].id
    secret_access_key = aws_iam_access_key.ses_access_key[count.index].secret
  })
}

# SES domain identity setup
resource "aws_ses_domain_identity" "domain_identity" {
  domain = var.domain
}

# SES domain DKIM setup
resource "aws_ses_domain_dkim" "domain_dkim" {
  domain = var.domain
}

# Domain verification setup in SES
resource "aws_ses_domain_identity_verification" "domain_verification" {
  domain = var.domain
}


