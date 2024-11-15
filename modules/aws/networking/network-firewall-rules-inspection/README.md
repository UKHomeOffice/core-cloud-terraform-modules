<!-- BEGIN_TF_DOCS -->
# Terraform Module for - network-firewall-rules-inspection
# Example terragrunt.hcl inputs 
```hcl
inputs = {
  name        = "cc-inspection-notprod-nfw-base-rules"
  description = "cc-inspection-notprod-nfw-base-rules"
  account_id  = "example-aws-account-id"
  vpc_id      = "vpc-example-id"
  network_firewall_name = "cc-inspection-notprod-nfw"
  network_firewall_policy_name = "cc-inspection-notprod-nfw-policy"
  rules_file = file("./rules.txt") 
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
| [aws_networkfirewall_rule_group.main_rules](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/networkfirewall_rule_group) | resource |
| [aws_networkfirewall_firewall.existing_firewall](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/networkfirewall_firewall) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_id"></a> [account\_id](#input\_account\_id) | Network Firewall Account-id | `string` | n/a | yes |
| <a name="input_aws_managed_rule_groups"></a> [aws\_managed\_rule\_groups](#input\_aws\_managed\_rule\_groups) | Network Firewall - A list of AWS maanged stateful rule group arns | `string` | n/a | yes |
| <a name="input_network_firewall_name"></a> [network\_firewall\_name](#input\_network\_firewall\_name) | Network Firewall name to be supplied | `string` | n/a | yes |
| <a name="input_network_firewall_policy_name"></a> [network\_firewall\_policy\_name](#input\_network\_firewall\_policy\_name) | Network Firewall Policy name to be supplied | `string` | n/a | yes |
| <a name="input_rules_file"></a> [rules\_file](#input\_rules\_file) | Network Firewall rules file | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to the resources. | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC assocaited with Network Firewall | `string` | n/a | yes |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_firewall_policy"></a> [firewall\_policy](#output\_firewall\_policy) | n/a |

<!-- END_TF_DOCS -->