variable "user_name" {
  type        = string
  description = "The name of the user to create."
  
  validation {
    condition     = length(var.user_name) >= 1 && length(var.user_name) <= 64
    error_message = "The user name must be less than 64 characters."
  }
}

variable "given_name" {
  type        = string
  description = "The given name of the user."

  validation {
    condition     = length(var.given_name) >= 1 && length(var.given_name) <= 64
    error_message = "The given name must be less than 64 characters."
  }
}

variable "family_name" {
  type        = string
  description = "The family name of the user."

  validation {
    condition     = length(var.family_name) >= 1 && length(var.family_name) <= 64
    error_message = "The family name must be less than 64 characters."
  }
}

variable "email" {
  type        = string
  description = "The email address of the user."
}

variable "identity_store_id" {
  description = "The AWS SSO instance to create the group in."
  type        = string

  validation {
    condition     = can(regex("d-[a-z0-9]{10}", var.identity_store_id))
    error_message = "The identity store id must be in the format `d-` followed by 10 alphanumeric characters."
  }
}
