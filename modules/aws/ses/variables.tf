variable "account_configs" {
  description = "List of accounts and their roles to configure SES"
  type = list(object({
    name  = string
    roles = list(object({
      role_name        = string
      domain_name      = string
      route53_zone_id  = string
    }))
  }))
}

variable "create_route53_records" {
  description = "Flag to create Route 53 DNS records for SES"
  type        = bool
  default     = true
}
