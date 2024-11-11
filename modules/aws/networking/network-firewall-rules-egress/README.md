<!-- BEGIN_TF_DOCS -->
# Terraform Module for - network-firewall-rules-egress
# Example terragrunt.hcl inputs 
```hcl
inputs = {
  name        = "cc-egress-notprod-nfw-base-rules"
  description = "cc-egress-notprod-nfw-base-rules"
  account_id  = "example-aws-account-id"
  vpc_id      = "vpc-example-id"
  network_firewall_name = "cc-egress-notprod-nfw"
  network_firewall_policy_name = "cc-egress-notprod-nfw-policy"
  cidr_input  = "172.16.0.0/16"    
  whitelisted_domains = file("./whitelisted-domains.txt")  
  aws_managed_rule_groups = file("./aws_managed_rule_groups.txt")      
  aws_region    = local.aws_region
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
| [aws_networkfirewall_firewall.existing_firewall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall) | resource |
| [aws_networkfirewall_firewall_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_firewall_policy) | resource |
| [aws_networkfirewall_rule_group.allow_domains_for_nonprod_01](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_networkfirewall_firewall.existing_firewall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/networkfirewall_firewall) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Network Firewall Account-id | `string` | n/a | yes |
| <a name="input_aws_managed_rule_groups"></a> [aws\_managed\_rule\_groups](#input\_aws\_managed\_rule\_groups) | Network Firewall - A list of AWS maanged stateful rule group arns | `string` | n/a | yes |
| <a name="input_cidr_input"></a> [cidr\_input](#input\_cidr\_input) | CIDR range | `string` | n/a | yes |
| <a name="input_network_firewall_name"></a> [network\_firewall\_name](#input\_network\_firewall\_name) | Network Firewall name to be supplied | `string` | n/a | yes |
| <a name="input_network_firewall_policy_name"></a> [network\_firewall\_policy\_name](#input\_network\_firewall\_policy\_name) | Network Firewall Policy name to be supplied | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC assocaited with Network Firewall | `string` | n/a | yes |
| <a name="input_whitelisted_domains"></a> [whitelisted\_domains](#input\_whitelisted\_domains) | Network Firewall - whitelisted domains file | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy) | n/a |

<!-- END_TF_DOCS -->