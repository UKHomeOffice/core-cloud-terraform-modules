resource "aws_ec2_transit_gateway_peering_attachment" "peering" {
  peer_account_id         = var.acp_account_id
  peer_region             = var.acp_region
  peer_transit_gateway_id = var.acp_tgw_id
  transit_gateway_id      = var.cc_hub_tgw_id
}