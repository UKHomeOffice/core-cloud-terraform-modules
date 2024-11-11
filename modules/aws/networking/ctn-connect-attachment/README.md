<!-- BEGIN_TF_DOCS -->
# Terraform Module for - ctn-connect-attachment
# Example terragrunt.hcl - inputs
```hcl
inputs = {
ctn_transit_gateway_attachment_id = "tgw-attach-id-example"
cc_hub_tgw_id                     = dependency.hub_tgw.outputs.ec2_transit_gateway_id
cc_transit_gateway_attachment_id = "cc-tgw-attach-id-example"
cc_destination_cidr_block = "10.251.0.0/16"
cc_transit_gateway_route_table_id = "tgw-rtb-id-example"
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
| [aws_ec2_transit_gateway_connect.connect](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_connect) | resource |
| [aws_ec2_transit_gateway_connect_peer.w2-tx01](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_connect_peer) | resource |
| [aws_ec2_transit_gateway_route.blackhole-route-table-entry](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cc_destination_cidr_block"></a> [cc\_destination\_cidr\_block](#input\_cc\_destination\_cidr\_block) | n/a | `string` | `""` | no |
| <a name="input_cc_hub_tgw_id"></a> [cc\_hub\_tgw\_id](#input\_cc\_hub\_tgw\_id) | n/a | `string` | `""` | no |
| <a name="input_cc_transit_gateway_attachment_id"></a> [cc\_transit\_gateway\_attachment\_id](#input\_cc\_transit\_gateway\_attachment\_id) | n/a | `string` | `""` | no |
| <a name="input_cc_transit_gateway_route_table_id"></a> [cc\_transit\_gateway\_route\_table\_id](#input\_cc\_transit\_gateway\_route\_table\_id) | n/a | `string` | `""` | no |
| <a name="input_ctn_transit_gateway_attachment_id"></a> [ctn\_transit\_gateway\_attachment\_id](#input\_ctn\_transit\_gateway\_attachment\_id) | n/a | `string` | `""` | no |
| <a name="input_tgw_connect"></a> [tgw\_connect](#input\_tgw\_connect) | n/a | `map` | <pre>{<br/>  "ctn_bgp_asn": "65086",<br/>  "gateway_cidr": "10.238.159.0/24",<br/>  "gre_cidr": "169.254.140.0/28",<br/>  "outside_ctn": [<br/>    "10.238.0.34",<br/>    "10.238.0.94"<br/>  ]<br/>}</pre> | no |
## Outputs

No outputs.

<!-- END_TF_DOCS -->