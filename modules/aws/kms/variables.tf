variable "description" {
  type        = string
  description = "The description of the KMS Key to create."

  validation {
    condition     = length(var.description) >= 1 && length(var.description) <= 256
    error_message = "The description must be less than 256 characters."
  }
