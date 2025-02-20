variable "transit_gateway_id" {
  description = "The ID of the Transit Gateway."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to attach."
  type        = string
}

variable "azs" {
  description = "List of Availability Zones for which the dedicated /28 subnets exist. The order of the AZs determines the order of subnets used in the attachment."
  type        = list(string)
  # Example: ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "attachment_subnet_ids" {
  description = "A map of dedicated /28 subnet IDs for each AZ. The keys must match the AZ names provided in `azs`."
  type        = map(string)
  # Example:
  # {
  #   "eu-west-2a" = "cc-vpn-prod-tgwattach-a",
  #   "eu-west-2b" = "cc-vpn-prod-tgwattach-b",
  #   "eu-west-2c" = "cc-vpn-prod-tgwattach-c"
  # }
}

variable "transit_gateway_default_route_table_propagation" {
  description = "(Optional) Boolean whether the VPC Attachment should propagate routes with the EC2 Transit Gateway propagation default route table."
  type        = bool
  default     = true
}

variable "name" {
  type        = string
  description = "(Optional) Key-value tags for the EC2 Transit Gateway VPC Attachment."
}