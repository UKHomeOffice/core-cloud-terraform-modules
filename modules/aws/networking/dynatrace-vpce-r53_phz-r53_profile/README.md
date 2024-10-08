# core-cloud-vpc-endpoint-tf-module - VPC Endpoint Terraform Module

## Example Usage
```
 module "vpce" {
    source = "git::git::https://github.com/UKHomeOffice/core-cloud-vpc-endpoint-tf-module.git?ref=main"

    vpc_endpoint_name           = "some_service"
    vpc_id                      = "vpc-xxxxxxxxxxxxxxxxx"
    service_name                = "com.amazonaws.vpce.<region>.xxxxxxxxxxxxxxx"
    security_group_ids          = ["sg-xxxxxxxxxxxxxx"]
    subnet_ids                  = ["subnet-axxxxxxxxx", "subnet-bxxxxxxxxx", "subnet-cxxxxxxxx"]
    managed_private_dns_enabled = false
    custom_private_r53_zone     = "private.example.com"
 }
```

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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_route53_profile"></a> [route53\_profile](#module\_route53\_profile) | git::https://github.com/UKHomeOffice/core-cloud-route53-profile-tf-module.git | 0.1.0 |
| <a name="module_vpce"></a> [vpce](#module\_vpce) | git::https://github.com/UKHomeOffice/core-cloud-vpc-endpoint-tf-module.git | 0.1.1 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_custom_private_r53_associated_vpcs"></a> [custom\_private\_r53\_associated\_vpcs](#input\_custom\_private\_r53\_associated\_vpcs) | A list of additional VPC IDs that's to be associated with the custom Route53 PHZ | `list(string)` | `[]` | no |
| <a name="input_custom_private_r53_zone"></a> [custom\_private\_r53\_zone](#input\_custom\_private\_r53\_zone) | If desired specify a private dns hosted zone for the VPC endpoint | `string` | `""` | no |
| <a name="input_custom_private_r53_zone_ttl"></a> [custom\_private\_r53\_zone\_ttl](#input\_custom\_private\_r53\_zone\_ttl) | If desired specify the ttl of the dns record for the VPC endpoint | `string` | `"300"` | no |
| <a name="input_dynatrace_r53_records"></a> [dynatrace\_r53\_records](#input\_dynatrace\_r53\_records) | A map of route53 records to generate when provided a map of logical and actual dynatrace environments e.g. {test = nuh63189} | `map(string)` | `{}` | no |
| <a name="input_managed_private_dns_enabled"></a> [managed\_private\_dns\_enabled](#input\_managed\_private\_dns\_enabled) | Whether or not to associate a AWS managed private hosted zone with the specified VPC - AWS services and AWS Marketplace partner services only | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | The AWS region to deploy the vpc endpoint | `string` | `"eu-west-2"` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | The ID of one or more security groups to associate with the network interface. Applicable for endpoints of type Interface. If no security groups are specified, the VPC's default security group is associated with the endpoint. | `list(string)` | `[]` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | The ID of one or more subnets in which to create a network interface for the endpoint. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_endpoint_name"></a> [vpc\_endpoint\_name](#input\_vpc\_endpoint\_name) | The name of the VPC Endpoint resource - try and match the service name as close as possible | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The ID of the VPC in which the endpoint will be used | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_route53_record_zone_id"></a> [aws\_route53\_record\_zone\_id](#output\_aws\_route53\_record\_zone\_id) | n/a |
| <a name="output_aws_route53_records"></a> [aws\_route53\_records](#output\_aws\_route53\_records) | n/a |
| <a name="output_vpce_endpoint_arn"></a> [vpce\_endpoint\_arn](#output\_vpce\_endpoint\_arn) | n/a |
| <a name="output_vpce_endpoint_id"></a> [vpce\_endpoint\_id](#output\_vpce\_endpoint\_id) | n/a |
<!-- END_TF_DOCS -->
