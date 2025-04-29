variable "tags" {
  type        = map(string)
  description = "Tags to apply to AWS resources"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "private_subnet_filter" {
  type        = string
  description = "Name tag filter for private subnets"
}

variable "tenant" {
  description = "The tenant name"
  type        = string
}

variable "access_logs_bucket" {
  type        = string
  description = "S3 bucket for NLB access logs"
}
