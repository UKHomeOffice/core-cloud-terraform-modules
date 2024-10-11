variable "tgw_route_table_id" {
  description = "The Transit Gateway Route Table ID."
  type        = string
}

variable "tgw_route_table_name" {
  description = "The Transit Gateway Route Table Name."
  type        = string
}

variable static_routes_file {
    description = "A list of static routes to supply in a file"
    type        = string
}