# Core Cloud AWS Cost & Usage Report Module

This module is responsible for creating and managing Cost and Usage Reports  and their related infrastructure in AWS.

## Usage

```hcl
module "cost_usage_reports" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/cost_usage_reports"

  report_name                             = <VALUE>
  time_unit                               = <VALUE>
  format                                  = <VALUE>
  compression                             = <VALUE>
  additional_schema_elements              = <VALUE>
  bucket_name                             = <VALUE>
  bucket_region                           = <VALUE>
  additional_artifacts                    = <VALUE>
  s3_prefix                               = <VALUE>
  refresh_closed_reports                  = <VALUE>
  report_versioning                       = <VALUE>
  iam_role                                = <VALUE>
  lifecycle_rule                          = <VALUE>
  noncurrent_version_expiration_days      = <VALUE>
  expiration_days                         = <VALUE>
  inline_policy_name                      = <VALUE>
  billing_account                         = <VALUE>
  replication_rule                        = <VALUE>
  destination_bucket                      = <VALUE>
  
}
```

## Validation

This module expects the variables to conform to the following:
- `report_name` - Must be a string between 1 and 256 characters.
- `time_unit` - Valid values for time_unit are DAILY, HOURLY or MONTHLY.
- `format` - Valid values for format are textORcsv or Parquet.
- `compression` - Valid values for time_unit are GZIP, ZIP or Parquet.
- `additional_schema_elements` - Valid values for additional_schema_elements are RESOURCES or SPLIT_COST_ALLOCATION_DATA.
- `bucket_name` - Must be a string between 1 and 64 characters.
- `bucket_region` - - Must be an AWS region.
- `additional_artifacts` - Valid values for time_unit are REDSHIFT, QUICKSHIFT or ATHENA.
- `s3_prefix` - Must be a string between 1 and 256 characters.
- `refresh_closed_reports` - Boolean value.
- `report_versioning` - Valid values for report_versioning are CREATE_NEW_REPORT or OVERWRITE_REPORT.
- `iam_role` - Friendly name of the role. If omitted, Terraform will assign a random, unique name.
- `lifecycle_rule` - Must be a string between 1 and 256 characters.
- `noncurrent_version_expiration_days` - Must be a positive integer.
- `expiration_days` - Must be a positive integer.
- `inline_policy_name` - Must be a string between 1 and 256 characters.
- `billing_account` - Must be a 12 character string.
- `replication_rule` - Must be a string between 1 and 256 characters.
- `destination_bucket` - The destination_bucket ARN must be less than 256 characters.
