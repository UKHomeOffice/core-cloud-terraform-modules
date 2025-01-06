

# Fetch network interfaces for the internal NLB
data "aws_network_interfaces" "internal_nlb_ifs" {
  filter {
    name   = "description"
    values = ["ELB net/${var.tenant}-internal/*"]
  }
}

locals {
  internal_nlb_interface_ids = "${flatten(["${data.aws_network_interfaces.internal_nlb_ifs.ids}"])}"
}

data "aws_network_interface" "internal_nlb_ips" {
  count = var.apply_only ? length(local.internal_nlb_interface_ids) : 0
  id = "${local.internal_nlb_interface_ids[count.index]}"
}

output "aws_internal_nlb_network_interface_ips" {
  value = "${flatten([data.aws_network_interface.internal_nlb_ips.*.private_ips])}"
}