# Core Cloud AWS Group User Membership Module

This module is responsible for creating and managing group user memberships through Identity Center in AWS.

## Usage

```hcl
module "groups_user_membership" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/group-user-memberships"

  group_name        = <VALUE>
  identity_store_id = <VALUE>
  users             = ARRAY(<VALUE>)
}
```

## Validation

This module expects the variables to conform to the following:
- `group_name` - Must be a string between 1 and 64 characters.
- `users` - List containing the usernames to be added to the group.
- `identity_store_id` - Must be a valid Identity Store ID.
