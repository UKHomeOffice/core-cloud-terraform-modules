# Output the hosted zone ID
output "hosted_zone_id" {
  value = aws_route53_zone.aws_r53_zone.zone_id
}
