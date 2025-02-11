<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_vault.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |
| [aws_backup_vault_policy.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_vault_kms_key_arn"></a> [backup\_vault\_kms\_key\_arn](#input\_backup\_vault\_kms\_key\_arn) | ARN of the KMS key used to protect the AWS Backup vault. | `string` | `null` | no |
| <a name="input_backup_vault_policy_json"></a> [backup\_vault\_policy\_json](#input\_backup\_vault\_policy\_json) | Resource Policy JSON for the AWS Backup vault. | `string` | `""` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Backup Vault | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Resource tags | `map(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->