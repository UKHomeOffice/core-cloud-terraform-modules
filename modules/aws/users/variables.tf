variable "users" {
  type = map(object({
    given_name  = string
    family_name = string
    email       = string
  }))

  validation {
    condition     = alltrue([for k, v in var.users : length(k) <= 64])
    error_message = "The user name must be less than 64 characters."
  }

  validation {
    condition     = alltrue([for k, v in var.users : length(v.given_name) > 0 && length(v.given_name) <= 64])
    error_message = "The given name must be less than 64 characters."
  }

  validation {
    condition     = alltrue([for k, v in var.users : length(v.family_name) > 0 && length(v.family_name) <= 64])
    error_message = "The family name must be less than 64 characters."
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
