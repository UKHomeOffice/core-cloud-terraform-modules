variable "bucket_name" {
  type        = string
  description = "The name of the s3 bucket to create."

  validation {
    condition     = length(var.bucket_name) >= 1 && length(var.bucket_name) <= 64
    error_message = "The bucket_name name must be less than 64 characters."
  }
}
