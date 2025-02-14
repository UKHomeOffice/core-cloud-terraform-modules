resource "aws_ec2_transit_gateway_connect" "connect" {
  transport_attachment_id                         = var.ctn_transit_gateway_attachment_id #VPC Attachment to N&I
  transit_gateway_id                              = var.cc_hub_tgw_id
  transit_gateway_default_route_table_association = true
}

resource "aws_ec2_transit_gateway_connect_peer" "w2-tx01" {
  for_each                      = { "a" : 0, "b" : 1 }
  peer_address                  = var.tgw_connect["outside_ctn"][each.value]
  transit_gateway_address       = cidrhost(var.tgw_connect["gateway_cidr"], each.value + 1)
  inside_cidr_blocks            = [cidrsubnet(var.tgw_connect["gre_cidr"], 1, each.value)]
  bgp_asn                       = var.tgw_connect["ctn_bgp_asn"]
  transit_gateway_attachment_id = aws_ec2_transit_gateway_connect.connect.id
}

resource "aws_ec2_transit_gateway_route" "blackhole-route-table-entry" {
  destination_cidr_block         = var.cc_destination_cidr_block
  transit_gateway_route_table_id = var.cc_transit_gateway_route_table_id
  transit_gateway_attachment_id  = var.cc_transit_gateway_attachment_id # CC Prod TGW attachment
}