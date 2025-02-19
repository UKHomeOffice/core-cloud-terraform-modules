<!-- BEGIN_TF_DOCS -->
  # Terraform Module for - fetching secrets from secrets manager
  # Example terragrunt.hcl inputs 
  ```hcl
  inputs = {
    secret_name = "dev/splunk/hec-token"  # example secret-name to fetch its secret value
  }
  ```
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |


## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.secret](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/secretsmanager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secret_name"></a> [secret\_name](#input\_secret\_name) | name of the secret to be fetched | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hec_token"></a> [hec\_token](#output\_hec\_token) | n/a |
<!-- END_TF_DOCS -->