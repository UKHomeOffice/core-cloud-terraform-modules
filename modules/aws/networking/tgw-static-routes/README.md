<!-- BEGIN_TF_DOCS -->
# Terraform Module for - tgw-static-routes
# Example terragrunt.hcl inputs 
```hcl
inputs = {
  tgw_route_table_id   = "tgw-rtb-example"   # get the correct rtb id from console
  tgw_route_table_name = "cc-post-inspection-prod-rt"
  static_routes_file   = file("./routes.yaml") 
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
| [aws_ec2_transit_gateway_route.tgw_routes](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_route) | resource |
| [aws_ec2_transit_gateway_route_table.tgw_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ec2_transit_gateway_route_table) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_static_routes_file"></a> [static\_routes\_file](#input\_static\_routes\_file) | A list of static routes to supply in a file | `string` | n/a | yes |
| <a name="input_tgw_route_table_id"></a> [tgw\_route\_table\_id](#input\_tgw\_route\_table\_id) | The Transit Gateway Route Table ID. | `string` | n/a | yes |
| <a name="input_tgw_route_table_name"></a> [tgw\_route\_table\_name](#input\_tgw\_route\_table\_name) | The Transit Gateway Route Table Name. | `string` | n/a | yes |
## Outputs

No outputs.

<!-- END_TF_DOCS -->