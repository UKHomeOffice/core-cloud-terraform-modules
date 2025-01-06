
resource "aws_route53_zone" "aws_r53_zone" {
  name         = var.domain_name
}


# Create an A record with wildcard domain for ALB in Perimeter
resource "aws_route53_record" "wildcard" {
  zone_id = aws_route53_zone.aws_r53_zone.zone_id
  name    = "*.${var.domain_name}"
  type    = "A"
  ttl     = 300
  records = ["10.20.30.40", "50.60.70.80"] # Replace these with the dummy ALB Public IPs

  # If you're using ALB DNS name instead of IPs, you can use alias record as follows:
  # alias {
  #   name                   = "your-alb-dns-name.us-west-2.elb.amazonaws.com"
  #   zone_id                = data.aws_route53_zone.existing.zone_id
  #   evaluate_target_health = true
  # }
}

