<!-- BEGIN_TF_DOCS -->
# Terraform Module for - eip
# Example terragrunt.hcl inputs 
```hcl
inputs = {
  name        = "cc-networking-tenant-canary-dev"
  description = "An EIP and its assocaition to transfer family vpc endpoint"
  aws_region  = local.aws_region
  tags = {
    Name = "cc-networking-${get_env("env_name", "")}"
  }
}
```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
## Requirements

No requirements.
## Resources

| Name | Type |
|------|------|
| [aws_eip.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources. | `map(string)` | `{}` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_eip_address"></a> [eip\_address](#output\_eip\_address) | n/a |
| <a name="output_eip_id"></a> [eip\_id](#output\_eip\_id) | outputs |

<!-- END_TF_DOCS -->