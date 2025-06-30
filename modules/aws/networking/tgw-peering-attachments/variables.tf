variable "central_hub_tgw_id" {
  description = "The Transit Gateway ID of the central hub"
  type        = string
}

variable "accounts" {
  description = "Map of accounts with their TGW details and tags"
  type = map(object({
    account_id = string
    hub_tgw_id = string
    tags       = map(string)
  }))
}

variable "region" {
  description = "AWS region for peering attachments"
  type        = string
  default     = "eu-west-2"
}
