output "tgw_peering_attachment_ids" {
  description = "Map of peering attachment IDs by environment (e.g., prod, notprod, central)"
  value = {
    for env, res in aws_ec2_transit_gateway_peering_attachment.tgw_peering :
    env => res.id
  }
}
