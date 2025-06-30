output "tgw_routes_created" {
  description = "Map of created TGW route resource IDs keyed by CIDR"
  value = {
    for cidr, res in aws_ec2_transit_gateway_route.to_remote_cidrs :
    cidr => res.id
  }
}
