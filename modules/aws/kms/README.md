# Core Cloud AWS KMS Module

This module is responsible for creating and managing KMS keys in AWS.

## Usage

```hcl
module "kms" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/kms"

  description         = <VALUE>
  rotation_enabled    = <VALUE>

}
```

## Validation
This module expects the variables to conform to the following:

- `description` - Must be a string between 1 and 256 characters.
- `rotation_enabled` - Must be a boolean value.
