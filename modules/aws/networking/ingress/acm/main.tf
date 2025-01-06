resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = "DNS"

  # Optional: Add SANs (Subject Alternative Names) if required
  # subject_alternative_names = ["www.${var.domain_name}"]

  # Apply tags if required
  tags = merge(
    var.tags,
    {
      Environment = var.environment
      Tenant      = var.tenant
    }
  )
}

# Fetch the public hosted zone by domain name
data "aws_route53_zone" "zone" {
  name         = var.domain_name
  private_zone = false  # Set to true if you're using a private hosted zone
}

# Create DNS records for certificate validation in Route 53
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for dvo in aws_acm_certificate.cert.domain_validation_options :
    dvo.domain_name => {
      name   = dvo.resource_record_name
      type   = dvo.resource_record_type
      value  = dvo.resource_record_value
    }
  }

  zone_id = data.aws_route53_zone.zone.zone_id  # Fetches the zone_id using the domain name
  name    = each.value.name
  type    = each.value.type
  records = [each.value.value]
  ttl     = 60
}


# After the DNS records are created, validate the certificate

resource "aws_acm_certificate_validation" "cert_validation" {
  certificate_arn         = aws_acm_certificate.cert.arn
  validation_record_fqdns = [for r in aws_route53_record.cert_validation : r.fqdn]
}
