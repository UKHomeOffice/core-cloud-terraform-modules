variable "ctn_transit_gateway_attachment_id" {
  default = ""
}

variable "cc_hub_tgw_id" {
  default = ""
}

variable "tgw_connect" {
  type = object({
    ctn_bgp_asn  = string,
    gateway_cidr = string,
    gre_cidr     = string,
    outside_ctn  = list(string)
  })
  default = {
    ctn_bgp_asn  = "65086"
    gateway_cidr = "10.238.159.0/24"  # Transit Gateway CIDR. Allocated. Minimum /24
    gre_cidr     = "169.254.140.0/28" # BGP CIDR Block 169.254.0.0/16
    outside_ctn = [
      "10.238.0.34", # W2A Hub
      "10.238.0.94"  # W2B Hub
    ]
  }
}

variable "cc_transit_gateway_attachment_id" {
  default = ""
}

variable "cc_destination_cidr_block" {
  default = ""
}

variable "cc_transit_gateway_route_table_id" {
  default = ""
}