<!-- BEGIN_TF_DOCS -->
# Terraform Module for AWS Transit Gateway VPC Attachment
This module creates an AWS Transit Gateway VPC attachment with dedicated, high-availability subnets: one per Availability Zone (AZ).
The module expects that you already have dedicated /28 subnets in your VPC—one in each Availability Zone (AZ). You must provide the IDs of these subnets (keyed by AZ) along with an ordered list of AZs. The module then uses these subnets for a HA Transit Gateway attachment.

# Example terragrunt.hcl - inputs
```hcl
inputs = {
transit_gateway_id = "tgw-0123456789abcdef0"
vpc_id             = "vpc-0123456789abcdef0"
azs              = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]

attachment_subnet_ids = {
  "eu-west-2a" = "cc-vpn-prod-tgwattach-a"
  "eu-west-2b" = "cc-vpn-prod-tgwattach-b"
  "eu-west-2c" = "cc-vpn-prod-tgwattach-c"
}
}
appliance_mode_support = false

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
| [aws_ec2_transit_gateway_vpc_attachment.twg_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appliance_mode_support"></a> [appliance\_mode\_support](#input\_appliance\_mode\_support) | Enable appliance mode support if required. | `bool` | `false` | no |
| <a name="input_attachment_subnet_ids"></a> [attachment\_subnet\_ids](#input\_attachment\_subnet\_ids) | A map of dedicated /28 subnet IDs for each AZ. The keys must match the AZ names provided in `azs`. | `map(string)` | n/a | yes |
| <a name="input_azs"></a> [azs](#input\_azs) | List of Availability Zones for which the dedicated /28 subnets exist. The order of the AZs determines the order of subnets used in the attachment. | `list(string)` | n/a | yes |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | The ID of the Transit Gateway. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC to attach. | `string` | n/a | yes |
## Outputs

No outputs.

<!-- END_TF_DOCS -->