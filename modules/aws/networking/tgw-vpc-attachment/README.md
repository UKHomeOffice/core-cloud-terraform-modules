<!-- BEGIN_TF_DOCS -->
# Terraform Module for AWS Transit Gateway VPC Attachment

This module creates an AWS Transit Gateway VPC attachment using the
[`aws_ec2_transit_gateway_vpc_attachment`](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) resource.

## Usage

You can use this module directly in Terraform or via [Terragrunt](https://terragrunt.gruntwork.io/).

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
  appliance_mode_support = false

  tags = {
    Environment = "prod"
    Project     = "example"
  }
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Requirements

It expects that you already have dedicated /28 subnets in your VPC—one in each Availability Zone (AZ). You must provide the IDs of these subnets (keyed by AZ) along with an ordered list of AZs. The module then uses these subnets for a highly available Transit Gateway attachment.

## Resources

| Name | Type |
|------|------|
| [aws_ec2_transit_gateway_vpc_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ec2_transit_gateway_vpc_attachment) | resource |

## Inputs

| Name                 | Description                                   | Type    | Default | Required |
|----------------------|-------------------------------------------------------------------|:--------:|
| `transit_gateway_id` | The ID of the Transit Gateway.                | `string`|  n/a     | yes     |
| `vpc_id`             | The ID of the VPC to attach.                  | `string`|  n/a    |  yes     |
| `azs`                | List of AZs where dedicated /28 subnets exist.| `list(string)`| n/a |yes     |
| `attachment_subnet_ids`| Map of dedicated /28 subnet IDs for each AZ.| `map(string)`|  n/a | yes    |
|                      | Keys must match the AZ names.                 |          |         |         |
| `appliance_mode_support`| Enable appliance mode support if required. | `bool`  | false    | no      |

## Outputs

No outputs.

<!-- END_TF_DOCS -->