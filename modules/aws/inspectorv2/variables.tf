variable "region" {
  type        = string
  description = "AWS region to operate in"
}

variable "audit_account_id" {
  type        = string
  description = "Audit (delegated admin) AWS Account ID"
}

