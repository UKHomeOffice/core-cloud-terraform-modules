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

variable "lambda_code_optional_additional_permissions" {
  type = list(string)
  description = "Optional additional permissions to add to the default lambda_code iam policy."
  default = []
}

variable "lambda_function_optional_additional_permissions" {
  type = list(string)
  description = "Optional additional permissions to add to the default lambda_function iam policy."
  default = []
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}
variable "logging_account_id" {
  description = "The AWS account ID where the CloudWatch Logs destination lives"
  type        = string
}
