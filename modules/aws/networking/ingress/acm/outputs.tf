output "acm_certificate_arn" {
  description = "The ARN of the ACM certificate"
  value       = aws_acm_certificate.cert.arn
}

output "route53_zone_id" {
  description = "The ID of the Route 53 hosted zone used for DNS validation"
  value       = data.aws_route53_zone.zone.zone_id
}
