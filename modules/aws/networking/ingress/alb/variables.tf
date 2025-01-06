variable "workload_external_nlb_ips" {
  description = "List of External NLB IPs"
  default     = ["1.2.3.4", "5.6.7.8", "9.1.2.3"]
}

variable "workload_internal_nlb_ips" {
  description = "List of Internal NLB IPs"
  default     = ["1.2.3.4", "5.6.7.8", "9.1.2.3"]
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to AWS resources"
}

variable "domain_name" {
  description = "The domain name for the hosted zone"
  type        = string
}

variable "environment" {
  description = "The environment (prod/non-prod)"
  type        = string
}

variable "tenant" {
  description = "The tenant name"
  type        = string
}