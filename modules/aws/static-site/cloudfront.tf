resource "aws_cloudfront_distribution" "default" {
  origin {
    domain_name = aws_s3_bucket.default.bucket_regional_domain_name
    origin_id   = aws_s3_bucket.default.id

    s3_origin_config {
      origin_access_identity = "origin-access-identity/ cloudfront/ ABCDEFG1234567"
    }
  }

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = var.index_document

  # TODO Configure logging for static site.
  #   logging_config {
  #     include_cookies = false
  #     bucket          = "mylogs. s3.amazonaws. com"
  #     prefix          = "myprefix"
  #   }

  aliases = var.cloudfront_aliases

  default_cache_behavior {
    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods = ["GET", "HEAD"]
    target_origin_id = aws_s3_bucket.default.id

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  price_class = var.cloudfront_price_class

  tags = {
    Tenant       = var.tenant
    Service      = var.service
    Env          = var.env
    CostCenter   = var.cost_center
    ServiceOwner = var.service_owner
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}


