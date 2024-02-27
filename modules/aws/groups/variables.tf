variable "group_name" {
  type        = string
  description = "The name of the group to create."
  
  validation {
    condition     = length(var.group_name) >= 1 && length(var.group_name) <= 64
    error_message = "The group name must be less than 64 characters."
  }
}

variable "group_description" {
  type        = string
  description = "The description of the group to create."
  
  validation {
    condition     = length(var.group_description) >= 1 && length(var.group_description) <= 256
    error_message = "The description must be less than 256 characters."
  }
}

variable "identity_store_id" {
  description = "The AWS SSO instance to create the group in."
  type        = string

  validation {
    condition     = can(regex("d-[a-z0-9]{10}", var.identity_store_id))
    error_message = "The identity store id must be in the format `d-` followed by 10 alphanumeric characters."
  }
}
