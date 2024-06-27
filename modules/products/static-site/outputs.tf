output "s3_bucket_name" {
  description = "Output the name of the bucket to use in deployment"
  value       = aws_s3_bucket.static_site.id
}

output "cloudfront_distribution_domain_name" {
  description = "The domain name corresponding to the distribution."
  value       = aws_cloudfront_distribution.static_site_distribution.domain_name
}
