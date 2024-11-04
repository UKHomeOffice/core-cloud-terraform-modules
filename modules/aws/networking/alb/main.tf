resource "aws_lb" "lb" {
  name               = var.name
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type
  subnets            = var.subnets
  security_groups    = [aws_security_group.sg.id]
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_deletion_protection       = var.enable_deletion_protection
  enable_http2                     = var.enable_http2

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
  protocol          = "HTTPS"

  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.certificate_arn

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}

resource "aws_lb_target_group" "lb_target_group" {
  name     = "${var.prefix}-tg"  # name can't be longer than 32 chars
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
  target_type = var.target_type

  health_check {
    protocol            = "HTTPS"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 10
    interval            = 30
  }

  tags = {
    Name = var.name
  }
}


# Target Group Attachment for IP targets
resource "aws_lb_target_group_attachment" "lb_target_group_attachment" {
  for_each = var.target_type == "ip" ? var.nlb_ips : {}

  target_group_arn = aws_lb_target_group.lb_target_group.arn
  target_id        = each.key               # each.key is the IP address
  port             = var.tg_port
  availability_zone = each.value            # each.value is the availability zone
}

