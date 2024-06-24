resource "aws_s3_bucket" "static_web_bucket" {
  bucket = local.bucket_name

  tags = {
    Name        = local.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_website_configuration" "static_web_bucket_config" {
  bucket = aws_s3_bucket.static_web_bucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "static_web_bucket" {
  bucket = aws_s3_bucket.static_web_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  restrict_public_buckets = false
}

data "aws_iam_policy_document" "static_web_bucket_policy_document" {
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
      "arn:aws:s3:::${aws_s3_bucket.static_web_bucket.id}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "static_web_bucket_policy" {
  bucket     = aws_s3_bucket.static_web_bucket.id
  policy     = data.aws_iam_policy_document.static_web_bucket_policy_document.json
  depends_on = [aws_s3_bucket_public_access_block.static_web_bucket]
}