# SSL Certificate
resource "aws_acm_certificate" "ssl_certificate" {
  provider          = aws.acm_provider
  domain_name       = local.web_url
  validation_method = var.validation_method

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "cert_validation" {
  provider                = aws.acm_provider
  certificate_arn         = aws_acm_certificate.ssl_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.validation : record.fqdn]
}