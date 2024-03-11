# Core Cloud AWS S3 Bucket Module

This module is responsible for creating and managing S3 Buckets in AWS.

## Usage

```hcl
module "s3_buckets" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/s3_buckets"

  bucket_name        = <VALUE>
}
```

## Validation

This module expects the variables to conform to the following:
- `bucket_name` - Must be a string between 1 and 64 characters.

