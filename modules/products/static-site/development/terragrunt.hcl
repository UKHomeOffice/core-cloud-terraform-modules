terraform {
  source = "../static-site"
}

inputs = {
  domain_name             = ""
  validation_method       = "DNS"
  environment             = "development"
  bucket_name             = ""
  origin_id               = "S3testOrigin"
  cloudfront_dist_comment = "Development cloudfront distribution"
  price_class             = "PriceClass_100"
}