# Core Cloud AWS Identity Center Instance Module

This module is responsible for retrieving the first Identity Store ID and ARN within an account. 

## Usage

```hcl
module "users" {
  source = "git::ssh://git@github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/ssoadmin_instance"
}
```

## Outputs

This module returns a singular `instance` output that contains the following attributes:
- `id` - The ID of the instance.
- `arn` - The ARN of the instance.
