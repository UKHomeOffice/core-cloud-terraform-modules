variable "groups" {
  type = map(object({
    group_description = string
  }))

  validation {
    condition     = alltrue([for k, v in var.groups : length(k) <= 64])
    error_message = "The group name must be less than 64 characters."
  }

  validation {
    condition     = alltrue([for k, v in var.groups : length(v.group_description) > 0 && length(v.group_description) <= 256])
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
