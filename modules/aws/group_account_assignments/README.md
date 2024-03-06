# Core Cloud AWS Group Account Assignation Module

This module is responsible for creating and managing group account assignments through Identity Center in AWS.

## Usage

```hcl
module "group_account_assignments" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/group_account_assignments"

  group_name     = each.key
  identity_store = module.aws_ssoadmin_instance.instance
  accounts       = each.value.accounts
}
```

## Validation

This module expects the variables to conform to the following:
- `group_name` - Must be a string between 1 and 64 characters.
- `accounts` - Key/Value pairing of the account ID and a list of permission sets.
- `identity_store` - Must be a valid Identity Store object that contains both the `id` and `arn` attributes.
