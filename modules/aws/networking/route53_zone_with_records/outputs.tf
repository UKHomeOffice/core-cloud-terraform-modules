output "aws_route53_record_zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "aws_route53_record_name" {
  value = module.records.route53_record_name
}

output "aws_route53_record_fqdn" {
  value = module.records.route53_record_fqdn
}
