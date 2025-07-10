# variables
variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  default     = {}
}

variable "account_id" {
  description = "Network Firewall Account-id"
  type        = string
}

variable "network_firewall_name" {
  description = "Network Firewall name to be supplied"
  type        = string
}

variable "network_firewall_policy_name" {
  description = "Network Firewall Policy name to be supplied"
  type        = string
}

variable "vpc_id" {
  description = "VPC associated with Network Firewall"
  type        = string
}

variable "home_net_cidr_ranges" {
  description = "A set of CIDR ranges used fro the `HOME_NET` rule variable."
  type        = set(string)
}

variable "whitelisted_domains" {
  description = "Network Firewall - whitelisted domains file"
  type        = string
}

variable "aws_managed_rule_groups" {
  description = "Network Firewall - A list of AWS managed stateful rule group arns"
  type        = string
}

variable "kms_key" {
  description = "arn of the AWS KMS key used to encrypt Network Firewall"
  type        = string
}
