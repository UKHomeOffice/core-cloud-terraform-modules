locals {
  # Create an ordered list of subnet IDs based on the provided AZs.
  # The keys in the map `attachment_subnet_ids` must match the AZ names.
  ordered_attachment_subnet_ids = [
    for az in var.azs : var.attachment_subnet_ids[az]
  ]
}

resource "aws_ec2_transit_gateway_vpc_attachment" "twg_vpc" {
  transit_gateway_id = var.transit_gateway_id
  vpc_id             = var.vpc_id
  subnet_ids         = local.ordered_attachment_subnet_ids

}
