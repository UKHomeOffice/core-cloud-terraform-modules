variable "description" {
  type        = string
  description = "The description of the KMS Key to create."

  validation {
    condition     = length(var.description) >= 1 && length(var.description) <= 256
    error_message = "The description must be less than 256 characters."
  }
}

variable "rotation_enabled" {
  type        = bool
  description = "Optional, required to be enabled if rotation_period_in_days is specified) Specifies whether key rotation is enabled. Defaults to false."

}

