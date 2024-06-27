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

#locals {
#  web_url = var.environment == "production" ? var.domain_name : "${var.environment}.${var.domain_name}"
#  bucket_name = var.environment == "production" ? var.bucket_name : "${var.environment}.${var.bucket_name}"
#}

locals {
  common_tags = {
    COST_CENTRE = var.COST_CENTRE
    PRODUCT     = var.product
    COMPONENT   = var.component
  }
}
