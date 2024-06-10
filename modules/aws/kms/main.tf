terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0, < 6.0.0"
    }
  }
}

provider "aws" {
  region = "eu-west-2"
}

resource "aws_kms_key" "example" {
  description             = var.description
  enable_key_rotation     = var.rotation_enabled
  policy                  = var.policy

}
