<!-- BEGIN_TF_DOCS -->
# Terraform Module for - backup-vault
# Example terragrunt.hcl - inputs
```hcl
inputs = {
  name = "local-backup-vault"
}
```
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

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | Name of the Backup Vault | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->