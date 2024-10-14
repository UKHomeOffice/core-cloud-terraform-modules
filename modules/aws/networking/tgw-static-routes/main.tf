
# Data resource to fetch the existing TGW route table by name or ID
data "aws_ec2_transit_gateway_route_table" "tgw_rt" {
  #id = var.tgw_route_table_id
  filter {
    name   = "tag:Name"
    values = [var.tgw_route_table_name]  # Can be fetched or passed from Terragrunt
  }
}

# Read routes from the text file (routes.json)
locals {
  routes = yamldecode(var.static_routes_file)
}

# Add static routes to the TGW route table using the data from the text file
resource "aws_ec2_transit_gateway_route" "tgw_routes" {
  for_each = { for route in local.routes["routes"] : route.cidr_block => route }

  transit_gateway_route_table_id = data.aws_ec2_transit_gateway_route_table.tgw_rt.id
  destination_cidr_block         = each.value.cidr_block
  transit_gateway_attachment_id  = each.value.transit_gateway_attachment_id
}


