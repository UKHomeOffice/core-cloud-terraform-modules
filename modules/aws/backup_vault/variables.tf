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

variable "org_id" {
  description = "The AWS Organization ID (e.g. o-xxxxxxxxxx)"
  type        = string
}

variable "backup_account_id" {
  description = "AWS account ID that needs decrypt/encrypt access to this vault key"
  type        = string
}

variable "kms_key_alias" {
  description = "Optional: custom alias (without the 'alias/' prefix). If empty, defaults to '<name>-key'."
  type        = string
  default     = ""
}

variable "kms_key_enable_rotation" {
  description = "Whether to enable automatic annual rotation on the CMK"
  type        = bool
  default     = true
}

variable "kms_key_deletion_window_days" {
  description = "Pending window in days before the CMK is destroyed"
  type        = number
  default     = 7
}
