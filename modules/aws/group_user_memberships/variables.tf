variable "identity_store_id" {
  description = "The AWS SSO instance to create the group in."
  type        = string

  validation {
    condition     = can(regex("d-[a-z0-9]{10}", var.identity_store_id))
    error_message = "The identity store id must be in the format `d-` followed by 10 alphanumeric characters."
  }
}

variable "members" {
  description = "The map of user names with their identifier to add to the group."
  type        = map(string)
}

variable "group" {
  description = "The ID of the group to assign the users to."
  type        = string
  nullable    = false
}
