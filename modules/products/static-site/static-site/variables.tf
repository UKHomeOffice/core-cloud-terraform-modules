variable "domain_name" {
  description = "The domain name to use for the site"
  type        = string
}

variable "validation_method" {
  description = "The SSL domain name validation method to use DNS/EMAIL"
  type        = string
}

variable "environment" {
  description = "Environment name used for tags"
  type        = string
}

variable "bucket_name" {
  description = "Name to use for the static site bucket hosting"
  type        = string
}

variable "origin_id" {
  description = "Cloudfront dist origin ID"
  type        = string
}

variable "cloudfront_dist_comment" {
  description = "CloudFront distribution comment"
  type        = string
}

variable "price_class" {
  description = "Pricing class to use for CloudFront"
  type        = string
}