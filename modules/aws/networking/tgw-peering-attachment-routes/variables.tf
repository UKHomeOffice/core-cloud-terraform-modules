variable "remote_cidrs" {
  description = "List of remote CIDRs to add as routes"
  type        = list(string)
}

variable "tgw_rt_id" {
  description = "Transit Gateway Route Table ID where routes will be created"
  type        = string
}

variable "peering_attachment_id" {
  description = "Peering attachment to which remote CIDRs should route"
  type        = string
}
