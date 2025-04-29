variable "region" {
  type        = string
  description = "AWS region to operate in"
}

variable "dev_lza_mgmt_id" {
  type        = string
  description = "Management account ID for dev-lza"
}

variable "prod_lza_mgmt_id" {
  type        = string
  description = "Management account ID for prod-lza"
}

variable "dev_audit_account_id" {
  type        = string
  description = "Audit account ID for dev-lza"
}

variable "prod_audit_account_id" {
  type        = string
  description = "Audit account ID for prod-lza"
}
