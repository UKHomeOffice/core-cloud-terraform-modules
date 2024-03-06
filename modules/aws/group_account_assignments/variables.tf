variable "identity_store" {
  description = "The AWS SSO instance to create the group in."
  type        = object({
    id   = string
    arn  = string 
  })
}

variable "accounts" {
  description = "The AWS accounts to assign the group to."
  type = map(list(string))
}

variable "group_name" {
  description = "The ID of the group to assign the user to."
  type        = string

  validation {
    condition     = length(var.group_name) >= 1 && length(var.group_name) <= 64
    error_message = "The group name must be less than 64 characters."
  }
}
