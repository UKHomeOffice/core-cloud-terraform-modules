resource "aws_security_group" "sg" {
  name        = "${var.name}-sg"
  description = "SG for ${var.name}"
  vpc_id      = var.vpc_id

  # Ingress rules
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks  = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  # Egress rules
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks  = egress.value.cidr_blocks
      description = egress.value.description
    }
  }
}