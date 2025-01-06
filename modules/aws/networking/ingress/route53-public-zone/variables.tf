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
