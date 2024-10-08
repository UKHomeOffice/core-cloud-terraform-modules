resource "aws_route53_zone" "this" {
  name = var.r53_zone

  dynamic "vpc" {
    for_each = toset(var.vpc_id)
    content {
      vpc_id = vpc.key
    }
  }
  tags = var.tags
}

module "records" {
  source  = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 4"

  zone_id             = aws_route53_zone.this.zone_id
  records_jsonencoded = var.r53_records_as_json

  depends_on = [aws_route53_zone.this]
}
