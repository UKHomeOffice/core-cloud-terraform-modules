variable "identity_store_id" {
  description = "The AWS SSO instance to create the group in."
  type        = string

  validation {
    condition     = can(regex("d-[a-z0-9]{10}", var.identity_store_id))
    error_message = "The identity store id must be in the format `d-` followed by 10 alphanumeric characters."
  }
}

variable "users" {
  description = "The AWS accounts to assign the group to."
  type = list(string)
}

variable "group_name" {
  description = "The ID of the group to assign the user to."
  type        = string

  validation {
    condition     = length(var.group_name) >= 1 && length(var.group_name) <= 64
    error_message = "The group name must be less than 64 characters."
  }
}
