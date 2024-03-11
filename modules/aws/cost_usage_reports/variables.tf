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
  type        = string
  description = "A list of schema elements."

  validation {
    condition     = contains(["RESOURCES", "SPLIT_COST_ALLOCATION_DATA"], var.additional_schema_elements)
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
    condition     = length(var.bucket_region) >= 1 && length(var.bucket_region) <= 20
    error_message = "The bucket_region name must be less than 20 characters."
  }
}

variable "additional_artifacts" {
  type        = string
  description = "A list of additional artifacts."

  validation {
    condition     = contains(["REDSHIFT", "QUICKSHIFT", "ATHENA"], var.additional_artifacts)
    error_message = "Valid values for time_unit are (REDSHIFT, QUICKSHIFT, ATHENA)"
  }
}

variable "s3_prefix" {
  type        = string
  description = "Report path prefix."

  validation {
    condition     = length(var.s3_prefix) >= 1 && length(var.s3_prefix) <= 256
    error_message = "The s3_prefix must be less than 256 characters."
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