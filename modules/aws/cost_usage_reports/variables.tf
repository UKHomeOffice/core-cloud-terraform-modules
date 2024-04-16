variable "report_name" {
  type        = string
  description = "The name of the cost and usage report to create."

  validation {
    condition     = length(var.report_name) >= 1 && length(var.report_name) <= 256
    error_message = "The report_name name must be less than 256 characters."
  }
}

variable "time_unit" {
  type        = string
  description = "The frequency on which report data are measured and displayed."

  validation {
    condition     = contains(["DAILY", "HOURLY", "MONTHLY"], var.time_unit)
    error_message = "Valid values for time_unit are (DAILY, HOURLY, MONTHLY)"
  }
}

variable "format" {
  type        = string
  description = "The format for the report."

  validation {
    condition     = contains(["textORcsv", "Parquet"], var.format)
    error_message = "Valid values for format are (textORcsv, Parquet)"
  }
}

variable "compression" {
  type        = string
  description = "Compression format for report."

  validation {
    condition     = contains(["GZIP", "ZIP", "Parquet"], var.compression)
    error_message = "Valid values for time_unit are (GZIP, ZIP, Parquet)"
  }
}

variable "additional_schema_elements" {
  type        = list(string)
  description = "A list of schema elements."

  validation {
    condition     = contains(var.additional_schema_elements, "RESOURCES") || contains(var.additional_schema_elements, "SPLIT_COST_ALLOCATION_DATA")
    error_message = "Valid values for additional_schema_elements are (RESOURCES, SPLIT_COST_ALLOCATION_DATA)"
  }
}

variable "bucket_name" {
  type        = string
  description = "The name of the existing s3 bucket store generated reports"

  validation {
    condition     = length(var.bucket_name) >= 1 && length(var.bucket_name) <= 64
    error_message = "The bucket_name name must be less than 64 characters."
  }
}

variable "bucket_region" {
  type        = string
  description = "Region of the existing S3 bucket to hold generated reports."

  validation {
    condition     = can(regex("[a-z][a-z]-[a-z]+-[1-9]", var.bucket_region))
    error_message = "Must be valid AWS Region names."
  }
}

variable "additional_artifacts" {
  type        = list(string)
  description = "A list of additional artifacts."

  validation {
    condition     = contains(var.additional_artifacts, "REDSHIFT") || contains(var.additional_artifacts, "QUICKSHIFT") || contains(var.additional_artifacts, "ATHENA")
    error_message = "Valid values for time_unit are (REDSHIFT, QUICKSHIFT, ATHENA)"
  }
}

variable "refresh_closed_reports" {
  type        = string
  description = "Set to true to update your reports after they have been finalized if AWS detects charges related to previous months."
}

variable "report_versioning" {
  type        = string
  description = "Overwrite the previous version of each report or to deliver the report in addition to the previous versions. Valid values are (CREATE_NEW_REPORT and OVERWRITE_REPORT)"
}

variable "iam_role" {
  type        = string
  description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name"
}

variable "lifecycle_rule" {
  type        = string
  description = "The name of the lifecycle rule applied to S3"

  validation {
    condition     = length(var.lifecycle_rule) >= 1 && length(var.lifecycle_rule) <= 256
    error_message = "The lifecycle_rule name must be less than 256 characters."
  }
}

variable "noncurrent_version_expiration_days" {
  type        = number
  description = "The Number of days an object is noncurrent before Amazon S3 can perform the associated action."

  validation {
    condition     = var.noncurrent_version_expiration_days > 0
    error_message = "The noncurrent_version_expiration_days variable must be a positive integer."
  }
}

variable "expiration_days" {
  type        = number
  description = "The lifetime, in days, of the objects that are subject to the rule.."

  validation {
    condition     = var.expiration_days > 0
    error_message = "The expiration_days variable must be a positive integer."
  }
}

variable "inline_policy_name" {
  type        = string
  description = "Name of the role policy."

  validation {
    condition     = length(var.inline_policy_name) >= 1 && length(var.inline_policy_name) <= 256
    error_message = "The inline_policy_name must be less than 256 characters."
  }
}

variable "billing_account" {
  type        = string
  description = "AccountID for the billing account"

  validation {
    condition     = length(var.billing_account) == 12
    error_message = "The billing_account id must be 12 characters."
  }
}

variable "replication_rule" {
  type        = string
  description = "The name of the replication rule applied to S3"

  validation {
    condition     = length(var.replication_rule) >= 1 && length(var.replication_rule) <= 256
    error_message = "The replication_rule name must be less than 256 characters."
  }
}

variable "destination_bucket" {
  type        = string
  description = "The ARN of the existing s3 bucket to replicate generated reports to."

  validation {
    condition     = length(var.destination_bucket) >= 1 && length(var.destination_bucket) <= 256
    error_message = "The destination_bucket ARN must be less than 256 characters."
  }
}
