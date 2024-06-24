terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  backend "s3" {
    bucket         = ""
    key            = "states/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = ""
  }
}

provider "aws" {
  region = "eu-west-2"
}

# required for ssl in cloudfront
# only distribs in N. Virgin allowed
provider "aws" {
  alias  = "acm_provider"
  region = "us-east-1"
}

locals {
  web_url = var.environment == "production" ? var.domain_name : "${var.environment}.${var.domain_name}"
  bucket_name = var.environment == "production" ? var.bucket_name : "${var.environment}.${var.bucket_name}"
}