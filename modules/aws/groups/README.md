# Core Cloud AWS Groups Module

This module is responsible for creating and managing groups through Identity Center in AWS.

## Usage

```hcl
module "groups" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/groups"

  group_name        = <VALUE>
  group_description = <VALUE>
  identity_store_id = <VALUE>
}
```

## Validation

This module expects the variables to conform to the following:
- `group_name` - Must be a string between 1 and 64 characters.
- `group_description` - Must be a string between 1 and 256 characters.
- `identity_store_id` - Must be a valid Identity Store ID.
