resource "aws_lb" "lb" {
  name               = var.name
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets
  security_groups    = [aws_security_group.sg.id]
  enable_cross_zone_load_balancing = true
  enable_deletion_protection       = false
  enable_http2                    = false

#   access_logs {
#     bucket  = var.access_logs_bucket
#     enabled = true
#   }

  tags = {
    Name = var.name
  }
}

resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.lb.arn
  port              = 443
  protocol          = "TLS"

  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}

resource "aws_lb_target_group" "lb_target_group" {
  name     = "${var.prefix}-tg"  # name can't be longer than 32 chars
  port     = var.tg_port     # "80"
  protocol = var.tg_protocol # "TCP"
  vpc_id   = var.vpc_id
  target_type = var.target_type

  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 10
    interval            = 30
  }

  tags = {
    Name = var.name
  }
}


# Create target group attachments for instance targets
resource "aws_lb_target_group_attachment" "instance_target_group_attachment" {
  for_each = var.target_type == "instance" ? var.instance_targets : {}

  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = each.key          # each.key is the instance ID
  port             = 80
}


# Data source to fetch the network interfaces for the NLB
data "aws_network_interfaces" "lb_enis" {
  depends_on = [aws_lb.lb]
  filter {
    name   = "description"
    values = ["ELB ${aws_lb.lb.arn_suffix}"]
  }
}
# Fetch the details of each network interface using its ID
data "aws_network_interface" "lb_interface" {
  for_each = toset(data.aws_network_interfaces.lb_enis.ids)

  id = each.value
}

