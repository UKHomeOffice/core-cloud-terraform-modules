# Output IAM user credentials (Access Key IDs and Secret Access Keys)
output "ses_secrets_arn" {
  value = aws_secretsmanager_secret.ses_secret[*].arn
}

# Output the domain verification status
output "ses_domain_identity" {
  value = aws_ses_domain_identity.domain_identity.domain
}

output "ses_domain_verification_status" {
  value = aws_ses_domain_identity_verification.domain_verification.status
}
