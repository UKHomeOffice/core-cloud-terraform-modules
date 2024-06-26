# AWS Organizations AI Services Opt-Out Policy

This Terraform module creates and attaches an AWS Organizations AI Services Opt-Out Policy. The policy allows you to specify which AI services to opt-out of for your AWS Organization or specific AWS accounts.

## Resources

- `aws_organizations_policy`: Creates the AI services opt-out policy.
- `aws_organizations_policy_attachment`: Attaches the AI services opt-out policy to specified AWS Organization Units (OUs) or AWS accounts.

## Variables

### `policy_name`

- **Description**: The name of the AI services opt-out policy.
- **Type**: `string`
- **Default**: `"AIServicesOptOutPolicy"`

### `policy_description`

- **Description**: The description of the AI services opt-out policy.
- **Type**: `string`
- **Default**: `"Policy to opt out of AI services"`

### `apply_to_ous_or_accounts`

- **Description**: A list of AWS Organization OU IDs or AWS Account IDs that should have the policies applied (can be empty).
- **Type**: `list(string)`
- **Default**: `[]`

### `services_overrides`

- **Description**: Overrides for AI services opt-out policies.
- **Type**: `map`
- **Default**:
  ```hcl
  {
    "services": {
      "default": {
        "opt_out_policy": {
          "@@assign": "optOut"
        }
      }
    }
  }
