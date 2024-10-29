<!-- BEGIN_TF_DOCS -->
# Terraform Module - ALB

This module provisions resources for ... ALB

Example usage: terragrunt.hcl

```hcl
inputs = {

  name               = "cc-central-ingress-alb"
  prefix             = "cc-central-ingress-alb"
  load_balancer_type = "application"
  load_balancer_internal = false
  enable_deletion_protection = true 
  vpc_id             = "vpc-example"  
  subnets            = ["subnet-1", "subnet-2", "subnet-3"] # subnets from vpc
  certificate_arn     = "arn:aws:acm:eu-west-2:<account-id>:certificate/example_cert"
  access_logs_bucket  = "example-alb-accesslogs-bucket"

  tg_port             = "443"
  tg_protocol         = "HTTPS"
  target_type         = "ip"   # allowed values are: ip or instance or alb or lambda

  nlb_ips             = local.config.tenant.canary.dev.nlb_ips

  ingress_rules = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks  = ["0.0.0.0/0"]
      description = "Allow HTTPS traffic"
    },
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1" # All traffic
      cidr_blocks  = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    },
  ]
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
| [aws_lb.lb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.lb_target_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.lb_target_group_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs_bucket"></a> [access\_logs\_bucket](#input\_access\_logs\_bucket) | S3 bucket for NLB access logs | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ARN of the SSL certificate for HTTPS listener | `string` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A list of egress rules | <pre>list(object({<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks  = list(string)<br/>    description = string<br/>  }))</pre> | n/a | yes |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | enable\_deletion\_protection true or false | `string` | n/a | yes |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A list of ingress rules | <pre>list(object({<br/>    from_port   = number<br/>    to_port     = number<br/>    protocol    = string<br/>    cidr_blocks  = list(string)<br/>    description = string<br/>  }))</pre> | n/a | yes |
| <a name="input_load_balancer_internal"></a> [load\_balancer\_internal](#input\_load\_balancer\_internal) | load\_balancer\_internal - true or false | `string` | n/a | yes |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | load\_balancer\_type - network or application | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the resource/component | `string` | n/a | yes |
| <a name="input_nlb_ips"></a> [nlb\_ips](#input\_nlb\_ips) | Map of IP addresses to availability zones for target group attachment | `map(string)` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | prefix for the resource/component | `string` | n/a | yes |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnets where NLB will be deployed | `list(string)` | n/a | yes |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | Allowed values: ip or instance or alb | `string` | n/a | yes |
| <a name="input_tg_port"></a> [tg\_port](#input\_tg\_port) | target group port | `string` | n/a | yes |
| <a name="input_tg_protocol"></a> [tg\_protocol](#input\_tg\_protocol) | target group protocol | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where NLB will be deployed | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alb_dns_name"></a> [alb\_dns\_name](#output\_alb\_dns\_name) | The DNS name of the LB |
| <a name="output_alb_security_group_id"></a> [alb\_security\_group\_id](#output\_alb\_security\_group\_id) | n/a |


<!-- END_TF_DOCS -->
