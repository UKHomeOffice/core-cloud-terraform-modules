output "backup_vault_id" {
  description = "ID of the AWS Backup Vault"
  value       = aws_backup_vault.this.id
}

output "backup_vault_arn" {
  description = "ARN of the AWS Backup Vault"
  value       = aws_backup_vault.this.arn
}

output "cmek_key_id" {
  description = "ID of the customer-managed KMS key"
  value       = aws_kms_key.cmek.key_id
}

output "cmek_key_arn" {
  description = "ARN of the customer-managed KMS key"
  value       = aws_kms_key.cmek.arn
}

output "cmek_alias_arn" {
  description = "ARN of the CMK alias"
  value       = aws_kms_alias.cmek_alias.arn
}
