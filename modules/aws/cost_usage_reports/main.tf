terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.0.0, < 6.0.0"
    }
  }
}

resource "aws_cur_report_definition" "cur_report_definitions" {
  report_name                = var.report_name
  time_unit                  = var.time_unit
  format                     = var.format
  compression                = var.compression
  additional_schema_elements = var.additional_schema_elements
  s3_bucket                  = var.bucket_name
  s3_region                  = var.bucket_region
  additional_artifacts       = var.additional_artifacts
  s3_prefix                  = var.s3_prefix
  refresh_closed_reports     = var.refresh_closed_reports
  report_versioning          = var.report_versioning
}
