# AWS Organizations Tag Policy

This Terraform module creates and attaches an AWS Organizations TAG Policy. The policy allows you to specify which resources to be tagged of for your AWS Organization or specific AWS accounts.

## Resources

- `aws_organizations_policy`: Creates the tag policy.
- `aws_organizations_policy_attachment`: Attaches the tag policy to specified AWS Organization Units (OUs) or AWS accounts.

## Variables

### `policy_name`

- **Description**: The name of the Tag policy.
- **Type**: `string`
- **Default**: `"TagPolicy"`

### `policy_description`

- **Description**: The description of the Tag policy.
- **Type**: `string`
- **Default**: `"This Tag Policy will apply tags to resources"`

