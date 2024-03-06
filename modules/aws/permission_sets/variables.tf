variable "name" {
  type        = string
  description = "The name of the permission set to create."
  
  validation {
    condition     = length(var.name) >= 1 && length(var.name) <= 64
    error_message = "The group name must be less than 64 characters."
  }
}

variable "description" {
  type        = string
  description = "The description of the permission set to create."
  
  validation {
    condition     = length(var.description) >= 1 && length(var.description) <= 256
    error_message = "The description must be less than 256 characters."
  }
}

variable "identity_store_arn" {
  description = "The ARN of the Identity Center instance to create the permission set in."
  type        = string
}

variable "inline_policies" {
  description = "The inline policy to attach to the permission set."
  type        = list(object({
    sid       = optional(string)
    actions        = list(string)
    resources = list(string)
  }))
}
