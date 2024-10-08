# core-cloud-vpc-endpoint-tf-module - VPC Endpoint Terraform Module

## Example Usage
```
module "r53_zone_with_rec" {
   source = "git::git::https://github.com/UKHomeOffice/core-cloud-terraform-modules.git//modules/aws/networking/route53_zone_with_records?ref=main"

   vpc_id              = ["vpc-xxxxxxxxxxxxxxxxx"]
   r53_zone            = "example.com"
   r53_records_as_json = jsonencode(
      [
         {
            name    = "api"
            type    = "A"
            alias   = {
               name    = "xxxxxxxxxxx.execute-api.eu-west-1.amazonaws.com"
               zone_id = "XXXXXXXXXX"
            }
         },
         {
            name    = "www"
            type    = "A"
            ttl     = 3600
            records = [
               "127.0.0.1",
            ]
         },
      ]
   )
}

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
| <a name="module_records"></a> [records](#module\_records) | terraform-aws-modules/route53/aws//modules/records | ~> 4 |

## Resources

| Name | Type |
|------|------|
| [aws_route53_zone.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_r53_records_as_json"></a> [r53\_records\_as\_json](#input\_r53\_records\_as\_json) | A JSON encoded String of the records for the Route53 Zone you wish to create, please see example for usage. It's JSON encoded due to Terragrunt Bug - https://github.com/gruntwork-io/terragrunt/issues/1211 | `string` | n/a | yes |
| <a name="input_r53_zone"></a> [r53\_zone](#input\_r53\_zone) | The name of the Route53 Zone. e.g example.com | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | A list of VPCs to associate the Route53 Zone with - setting this will create a Private Hosted Zone (PHZ) | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_route53_record_fqdn"></a> [aws\_route53\_record\_fqdn](#output\_aws\_route53\_record\_fqdn) | n/a |
| <a name="output_aws_route53_record_name"></a> [aws\_route53\_record\_name](#output\_aws\_route53\_record\_name) | n/a |
| <a name="output_aws_route53_record_zone_id"></a> [aws\_route53\_record\_zone\_id](#output\_aws\_route53\_record\_zone\_id) | n/a |
<!-- END_TF_DOCS -->
