terraform {
  required_version = ">=1.9.8"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "2.6.0"
    }
  }
}

provider "archive" {}

provider "aws" {}