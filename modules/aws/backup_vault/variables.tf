variable "name" {
  description = "Name of the Backup Vault"
  type        = string
}

variable "backup_vault_policy_json" {
  description = "Resource Policy JSON for the AWS Backup vault."
  type        = string
  default     = ""
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
