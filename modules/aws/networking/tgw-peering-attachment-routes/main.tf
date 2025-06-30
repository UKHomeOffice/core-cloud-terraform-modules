resource "aws_ec2_transit_gateway_route" "to_remote_cidrs" {
  for_each = toset(var.remote_cidrs)

  destination_cidr_block         = each.value
  transit_gateway_route_table_id = var.tgw_rt_id
  transit_gateway_attachment_id  = var.peering_attachment_id
}
