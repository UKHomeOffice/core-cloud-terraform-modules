# Core Cloud AWS Cost & Usage Report Module

This module is responsible for creating and managing Cost and Usage Reports  and their related infrastructure in AWS.

## Usage

```hcl
module "cost_usage_reports" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/cost_usage_reports"

  report_name                   = <VALUE>
  time_unit                     = <VALUE>
  format                        = <VALUE>
  compression                   = <VALUE>
  additional_schema_elements    = <VALUE>
  s3_bucket                     = <VALUE>
  s3_region                     = <VALUE>
  additional_artifacts          = <VALUE>
  s3_prefix                     = <VALUE>
  refresh_closed_reports        = <VALUE>
  report_versioning             = <VALUE>
  
  
}
```

## Validation

This module expects the variables to conform to the following:
- `report_name` - Must be a string between 1 and 256 characters.
- `time_unit` - Valid values for time_unit are DAILY, HOURLY or MONTHLY.
- `format` - Valid values for format are textORcsv or Parquet.
- `compression` - Valid values for time_unit are GZIP, ZIP or Parquet.
- `additional_schema_elements` - Valid values for additional_schema_elements are RESOURCES or SPLIT_COST_ALLOCATION_DATA.
- `s3_bucket` - Must be a string between 1 and 64 characters.
- `s3_region` - - Must be a string between 1 and 20 characters.
- `additional_artifacts` - Valid values for time_unit are REDSHIFT, QUICKSHIFT or ATHENA.
- `s3_prefix` - Must be a string between 1 and 256 characters.
- `refresh_closed_reports`
- `report_versioning`
