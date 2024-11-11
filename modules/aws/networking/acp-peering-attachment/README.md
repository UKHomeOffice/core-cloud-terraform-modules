<!-- BEGIN_TF_DOCS -->
# Terraform Module for - acp-peering-attachment
# Example terragrunt.hcl - inputs
```hcl
inputs = {
  acp_account_id = "aws-account-id"
  acp_region = "eu-west-2"
  acp_tgw_id = "tgw-id"
  cc_hub_tgw_id = dependency.hub_tgw.outputs.ec2_transit_gateway_id
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
| [aws_ec2_transit_gateway_peering_attachment.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_peering_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acp_account_id"></a> [acp\_account\_id](#input\_acp\_account\_id) | n/a | `string` | `""` | no |
| <a name="input_acp_region"></a> [acp\_region](#input\_acp\_region) | n/a | `string` | `"eu-west-2"` | no |
| <a name="input_acp_tgw_id"></a> [acp\_tgw\_id](#input\_acp\_tgw\_id) | n/a | `string` | `""` | no |
| <a name="input_cc_hub_tgw_id"></a> [cc\_hub\_tgw\_id](#input\_cc\_hub\_tgw\_id) | n/a | `string` | `""` | no |
## Outputs

No outputs.

<!-- END_TF_DOCS -->