terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5.0.0, < 6.0.0"
    }
  }
}

resource "aws_s3_bucket" "s3_buckets" {
  bucket = var.bucket_name
}
