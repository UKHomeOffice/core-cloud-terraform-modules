resource "aws_s3_bucket" "static_site" {
  bucket = "cc-static-site-${var.tags.product}-${var.tags.component}"

  tags = local.common_tags
}

resource "aws_s3_bucket_website_configuration" "static_site_config" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "static_site_acl" {
  bucket = aws_s3_bucket.static_site.id

  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_versioning" "static_site_versioning" {
  bucket = aws_s3_bucket.static_site.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "static_site_encryption" {
  bucket = aws_s3_bucket.static_site.id
  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.static_site_kms.arn
      sse_algorithm     = "aws:kms"
    }
    bucket_key_enabled = true
  }
}


data "aws_iam_policy_document" "static_site_policy_document" {
  statement {
    sid    = "PublicReadGetObject"
    effect = "Allow"
    principals {
      type        = "*"
      identifiers = ["*"]
    }
    actions = [
      "s3:GetObject"
    ]
    resources = [
      "arn:aws:s3:::${aws_s3_bucket.static_site.id}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "static_site_policy" {
  bucket     = aws_s3_bucket.static_site.id
  policy     = data.aws_iam_policy_document.static_site_policy_document.json
  depends_on = [aws_s3_bucket_public_access_block.static_site_acl]
}
