variable "dynamodb_arn" {
  description = "The ARN the dynamodb table the policy is for."
  type        = string
}

variable "dynamodb_resource_policy_json" {
  description = "The dynamodb policy in JSON format to apply."
  type        = string
}

variable "confirm_remove_self_resource_access" {
  description = "Set this parameter to true to confirm that you want to remove your permissions to change the policy of this resource in the future."
  type        = bool
  default     = false
}
