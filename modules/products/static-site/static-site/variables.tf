#Global
variable "product" {
  description = "The name of the product"
  type        = string
}

variable "component" {
  description = "The name of the component"
  type        = string
}

variable "COST_CENTRE" {
  description = "The cost code of the project"
  type        = string
}


#Cloudfront

variable "cloudfront_aliases" {
  description = "CloudFront aliases to apply using custom DNS record"
  type        = list(string)
  default     = []
}

variable "cloudfront_price_class" {
  description = "Price class for the CloudFront distribution"
  type        = string
  default     = "PriceClass_100"
}


#IAM

variable "repository" {
  description = "The repository containing the files for the static site"
  type        = string
  validation {
    condition     = startswith(var.repository, "UKHomeOffice/")
    error_message = "Should be in the UKHomeOffice organisation"
  }
}
