output "acm_certificate_arn" {
  description = "The ARN of the certificate"
  value       = try(aws_acm_certificate.ssl_certificate.arn)
}

output "acm_certificate_domain_validation_options" {
  description = "A list of attributes to feed into other resources to complete certificate validation. Can have more than one element, e.g. if SANs are defined. Only set if DNS-validation was used."
  value       = flatten(aws_acm_certificate.ssl_certificate.domain_validation_options)
}

output "acm_certificate_status" {
  description = "Status of the certificate."
  value       = try(aws_acm_certificate.ssl_certificate.status)
}

output "acm_certificate_validation_emails" {
  description = "A list of addresses that received a validation E-Mail. Only set if EMAIL-validation was used."
  value       = flatten(aws_acm_certificate.ssl_certificate.validation_emails)
}

output "s3_bucket_name" {
  description = "Output the name of the bucket to use in deployment"
  value       = aws_s3_bucket.static_web_bucket.id
}