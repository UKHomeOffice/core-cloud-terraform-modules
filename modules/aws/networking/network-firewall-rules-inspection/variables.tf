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
    description = "VPC assocaited with Network Firewall"
    type        = string  
}

variable "rules_file" {
    description = "Network Firewall rules file"
    type        = string  
}

variable "aws_managed_rule_groups" {
    description = "Network Firewall - A list of AWS maanged stateful rule group arns"
    type        = string  
}