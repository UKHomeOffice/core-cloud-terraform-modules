<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_dynamodb_resource_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_resource_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_confirm_remove_self_resource_access"></a> [confirm\_remove\_self\_resource\_access](#input\_confirm\_remove\_self\_resource\_access) | Set this parameter to true to confirm that you want to remove your permissions to change the policy of this resource in the future. | `bool` | `false` | no |
| <a name="input_dynamodb_arn"></a> [dynamodb\_arn](#input\_dynamodb\_arn) | The ARN the dynamodb table the policy is for. | `string` | n/a | yes |
| <a name="input_dynamodb_resource_policy_json"></a> [dynamodb\_resource\_policy\_json](#input\_dynamodb\_resource\_policy\_json) | The dynamodb policy in JSON format to apply. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_resource_policy_arn"></a> [dynamodb\_resource\_policy\_arn](#output\_dynamodb\_resource\_policy\_arn) | n/a |
| <a name="output_revision_id"></a> [revision\_id](#output\_revision\_id) | n/a |
<!-- END_TF_DOCS -->