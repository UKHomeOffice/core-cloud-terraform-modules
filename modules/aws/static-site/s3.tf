resource "aws_s3_bucket" "default" {
  bucket = "cc-static-site-${var.tenant}-${var.service}-${var.env}"

  tags = {
    Tenant       = var.tenant
    Service      = var.service
    Env          = var.env
    CostCenter   = var.cost_center
    ServiceOwner = var.owner
    Repository   = var.repository
  }
}

resource "aws_s3_bucket_website_configuration" "default" {
  bucket = aws_s3_bucket.default.bucket
  index_document {
    suffix = var.index_document
  }

  error_document {
    key = var.error_document
  }
}