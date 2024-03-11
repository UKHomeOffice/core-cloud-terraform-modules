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

resource "aws_s3_bucket" "s3_buckets" {
  bucket = var.bucket_name
}

resource "aws_iam_role" "cur_role" {
  name = var.iam_role
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Action" : "sts:AssumeRole",
        "Principal" : {
          "Service" : "s3.amazonaws.com"
        },
        "Effect" : "Allow",
        "Sid" : ""
      }
    ]
  })
}

## ADD INLINE POLICY TO ROLE ABOVE

## S3 BUCKET POLICY

## S3 LIFECYCLE RULE

## REPLICATION RULE

