variable "name" {
  description = "Name of the Backup Vault"
  type        = string
}

variable "backup_vault_policy_json" {
  description = "Resource Policy JSON for the AWS Backup vault."
  type        = string
  default     = ""
}

variable "backup_vault_kms_key_arn" {
  description = "ARN of the KMS key used to protect the AWS Backup vault."
  type        = string
  default     = null
}

variable "enable_cross_account_backup" {
  description = "Enable cross account backup?"
  type = bool
  default = false
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
