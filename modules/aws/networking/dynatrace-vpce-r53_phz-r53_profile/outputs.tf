output "vpce_endpoint_id" {
  value = aws_vpc_endpoint.this.id
}

output "vpce_endpoint_arn" {
  value = aws_vpc_endpoint.this.arn
}

output "aws_route53_record_zone_id" {
  value = aws_route53_zone.this.zone_id
}

output "aws_route53_records" {
  value = aws_route53_record.this[*]
}
