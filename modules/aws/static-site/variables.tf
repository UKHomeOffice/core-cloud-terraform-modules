# Required tags

variable "tenant" {
  description = "The name of the tenant"
  type        = string
}

variable "service" {
  description = "The name of the service"
  type        = string
}

variable "env" {
  description = "The name of the environment"
  type        = string
  validation {
    condition = contains(["dev", "test", "prod"], var.env)
    error_message = "Should be 'dev', 'test' or 'prod'"
  }
}

variable "cost_center" {
  description = "The name of the cost center"
  type        = string
}

variable "owner" {
  description = "Contact for the service owner"
  type        = string
}

variable "repository" {
  description = "The repository containing the code for the static site"
  type        = string
  validation {
    condition = startswith(var.repository, "UKHomeOffice/")
    error_message = "Should be in the UKHomeOffice organisation"
  }
}

# S3

variable "index_document" {
  description = "The document that will be served by default"
  type        = string
  default     = "index.html"
}

variable "error_document" {
  description = "The document that will be served in the event of an error."
  type        = string
  default     = "error.html"
}

# CloudFront

variable "cloudfront_aliases" {
  description = "CloudFront aliases to apply using custom DNS record"
  type = list(string)
  default = []
}

variable "cloudfront_price_class" {
  description = "Price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}
