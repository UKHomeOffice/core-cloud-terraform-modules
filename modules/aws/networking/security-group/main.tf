resource "aws_security_group" "this" {
  name   = var.sg_name
  vpc_id = var.vpc_id
  tags = merge(
    var.tags,
    {
      "Name" = var.sg_name
    }
  )
}

resource "aws_vpc_security_group_ingress_rule" "ingress_rules" {
  count             = length(var.sg_ingress_rules)
  security_group_id = aws_security_group.this.id
  description       = var.sg_egress_rules[count.index].description
  from_port         = var.sg_ingress_rules[count.index].from_port
  to_port           = var.sg_ingress_rules[count.index].to_port
  ip_protocol       = var.sg_ingress_rules[count.index].ip_protocol
  cidr_ipv4         = var.sg_ingress_rules[count.index].cidr_ipv4

}

resource "aws_vpc_security_group_egress_rule" "egress_rules" {
  count             = length(var.sg_egress_rules)
  security_group_id = aws_security_group.this.id
  description       = var.sg_egress_rules[count.index].description
  from_port         = var.sg_egress_rules[count.index].from_port
  to_port           = var.sg_egress_rules[count.index].to_port
  ip_protocol       = var.sg_egress_rules[count.index].ip_protocol
  cidr_ipv4         = var.sg_egress_rules[count.index].cidr_ipv4
}
