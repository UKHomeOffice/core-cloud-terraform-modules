
resource "aws_ec2_transit_gateway_peering_attachment" "tgw_peering" {
  for_each = var.accounts

  transit_gateway_id      = var.central_hub_tgw_id
  peer_transit_gateway_id = each.value.hub_tgw_id
  peer_account_id         = each.value.account_id
  peer_region             = var.region
  tags                    = each.value.tags
}
