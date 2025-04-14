variable "cloudwatch_logs_destination_arn" {
  type        = string
  description = "The Arn of the CloudWatch logs destination."
}

variable "name" {
  type        = string
  description = "The name of the lambda function and subscription filter."
}

variable "tag_pattern" {
  type        = string
  description = "The tag pattern to match on."
}

variable "opt_in_tag_value" {
  type        = string
  description = "The tag value which indicates opting-in."
  default     = "true"
}

variable "opt_out_tag_value" {
  type        = string
  description = "The tag value which indicates opting-out."
  default     = "false"
}

variable "log_retention_in_days" {
  type        = number
  description = "The number of days retention for lambda CloudWatch log group."
  default     = 731
}

variable "kms_key" {
  description = "arn of KMS key used to encrypt CloudWatch logs"
  type        = string
}
