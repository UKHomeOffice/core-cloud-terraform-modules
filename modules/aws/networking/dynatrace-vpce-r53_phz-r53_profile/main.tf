module "vpce" {
  source = "git::https://github.com/UKHomeOffice/core-cloud-vpc-endpoint-tf-module.git?ref=0.1.1"

  vpc_id            = var.vpc_id
  service_name      = var.service_name
  vpc_endpoint_name = "dynatrace"
  vpc_endpoint_type = "Interface"

  security_group_ids          = var.security_group_ids
  subnet_ids                  = var.subnet_ids
  managed_private_dns_enabled = false

  tags = merge(
    var.tags,
    {
      "vpce_name" = "dynatrace"
      "vpce_id"   = var.vpc_id
    }
  )
}

resource "aws_route53_zone" "this" {
  name = "live.dynatrace.com"

  vpc {
    vpc_id = var.vpc_id
  }

  tags = merge(
    var.tags,
    {
      "vpce_name" = "dynatrace"
      "vpce_id"   = var.vpc_id
    }
  )
}

resource "aws_route53_record" "this" {
  for_each = var.dynatrace_r53_records

  zone_id = aws_route53_zone.this.zone_id
  name    = each.value
  type    = "A"

  alias {
    name                   = "${module.vpce.dns_entry[0]["dns_name"]}."
    zone_id                = module.vpce.dns_entry[0].hosted_zone_id
    evaluate_target_health = true
  }

  depends_on = [aws_route53_zone.this]
}

module "route53_profile" {
  source = "git::https://github.com/UKHomeOffice/core-cloud-route53-profile-tf-module.git?ref=0.1.0"

  r53_profile_name = "dynatrace"
  r53_zone_ids     = aws_route53_zone.this.zone_id

  tags = merge(
    var.tags,
    {
      "vpce_name"  = "dynatrace"
      "vpce_id"    = var.vpc_id
      "r53_phz_id" = aws_route53_zone.this.zone_id
    }
  )
}
