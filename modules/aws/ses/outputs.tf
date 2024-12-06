output "iam_role_name" {
  description = "IAM role names for SES"
  value       = { for account in var.account_configs : account.name => aws_iam_role.ses_role[account.name].name }
}

output "iam_policy_arn" {
  description = "IAM policy ARNs for SES"
  value       = { for account in var.account_configs : account.name => aws_iam_policy.ses_policy[account.name].arn }
}

output "instance_profile_name" {
  description = "Instance profile names"
  value       = { for account in var.account_configs : account.name => aws_iam_instance_profile.ses_instance_profile[account.name].name }
}

output "ses_domain_verification_token" {
  description = "SES domain verification tokens"
  value       = { for account in var.account_configs : account.name => aws_ses_domain_identity.ses_domain[account.name].verification_token }
}

output "dkim_tokens" {
  description = "DKIM tokens for SES"
  value       = { for account in var.account_configs : account.name => aws_ses_domain_identity.ses_domain[account.name].dkim_tokens }
}
