# Core Cloud AWS Identity Center Permission Set Module

This module is responsible for creating and managing permission sets through Identity Center in AWS.

## Usage

### Permission Set

```hcl
module "permission_sets" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/permission_sets"

  name                = <VALUE>
  description         = <VALUE>
  identity_store_arn  = <VALUE>
  inline_policies     = OPTIONAL(ARRAY(<INLINE_POLICY>))
  managed_policies    = OPTIONAL(ARRAY(<MANAGED_POLICY_NAME>))
}
```

## Validation

This module expects the variables to conform to the following:
- `name` - Must be a string between 1 and 64 characters.
- `description` - Must be a string between 1 and 256 characters.
- `identity_store_arn` - Must be a valid Identity Store ARN.
- `inline_policies` - Must be a list of objects that conforms to [Inline Policy](#inline-policy) schema. Can be empty.
- `managed_policies` - Must be a list of strings that are valid managed policy names. Can be empty.

### Inline Policy

```hcl
{
  sid       = OPTIONAL(<VALUE>)
  actions   = ARRAY(<VALUE>)
  resources = ARRAY(<VALUE>)
}
```

## Examples

### Simple Inline Policy

```yaml
name: "PermissionSetName"
description: "This is an example permission set."
identity_store_arn: "arn:aws:sso:::instance/ssoins-1234567890abcdef0"
inline_policies:
  - sid: "TestPolicy"
    actions:
      - s3:ListBucket
    resources: 
      - "*"
```
