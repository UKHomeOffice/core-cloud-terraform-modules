#tfsec:ignore:aws-s3-enable-bucket-logging
resource "aws_s3_bucket" "default" {
  bucket = "cc-static-site-${var.tenant}-${var.service}-${var.env}"

  block_public_acls = true

  tags = {
    Tenant       = var.tenant
    Service      = var.service
    Env          = var.env
    CostCenter   = var.cost_center
    ServiceOwner = var.owner
    Repository   = var.repository
  }
}

resource "aws_s3_bucket_public_access_block" "good_example" {
  bucket                  = aws_s3_bucket.default.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
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

resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.default.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.default.arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}

resource "aws_s3_bucket_versioning" "default" {
  bucket = aws_s3_bucket.default.id
  versioning_configuration {
    status = "Enabled"
  }
}