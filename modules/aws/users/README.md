# Core Cloud AWS Users Module

This module is responsible for creating and managing users through Identity Center in AWS.

## Usage

```hcl
module "users" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/users"

  user_name         = <VALUE>
  given_name        = <VALUE>
  family_name       = <VALUE>
  email             = <VALUE>
  identity_store_id = <VALUE>
}
```

## Validation

This module expects the variables to conform to the following:
- `user_name` - Must be a string between 1 and 64 characters.
- `given_name` - Must be a string between 1 and 64 characters.
- `family_name` - Must be a string between 1 and 64 characters.
- `email` - Must be a valid unique email address.
- `identity_store_id` - Must be a valid Identity Store ID.
