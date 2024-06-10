variable "description" {
  type        = string
  description = "The description of the KMS Key to create."

  validation {
    condition     = length(var.description) >= 1 && length(var.description) <= 256
    error_message = "The description must be less than 256 characters."
  }
}

variable "rotation_enabled" {
  type        = string
  description = "Optional, required to be enabled if rotation_period_in_days is specified) Specifies whether key rotation is enabled. Defaults to false."

  validation {
    condition     = contains(var.rotation_enabled, "true") || contains(var.rotation_enabled, "false")
    error_message = "Valid values for additional_schema_elements are (true, false)"
  }
}

variable "policy" {
  description = "JSON Encoded policy document for use as KMS Key Policy."
}
