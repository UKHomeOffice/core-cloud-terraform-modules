# Required tags

variable "tenant" {
  description = "The name of the tenant"
}

variable "service" {
  description = "The name of the service"
}

variable "env" {
  description = "The name of the environment"
  validation {
    condition = contains(["dev", "test", "prod"], var.env)
    error_message = "Should be 'dev', 'test' or 'prod'"
  }
}

variable "cost_center" {
  description = "The name of the cost center"
}

variable "owner" {
  description = "Contact for the service owner"
}

variable "repository" {
  description = "The repository containing the code for the static site"
}

# S3

variable "index_document" {
  default     = "index.html"
  description = "The document that will be served by default"
}

variable "error_document" {
  default     = "error.html"
  description = "The document that will be served in the event of an error."
}

# CloudFront

variable "cloudfront_aliases" {
  type = list(string)
  default = []
  description = "CloudFront aliases to apply using custom DNS record"
}

variable "cloudfront_price_class" {
  default     = "PriceClass_100"
  description = "Price class for the CloudFront distribution"
}
