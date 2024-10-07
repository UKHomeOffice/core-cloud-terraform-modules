output "vpce_endpoint_id" {
  value = module.vpce.vpce_endpoint_id
}

output "vpce_endpoint_arn" {
  value = module.vpce.vpce_endpoint_arn
}

output "aws_route53_record_zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "aws_route53_records_fqdn" {
  value = aws_route53_record.this[*].fqdn
}
