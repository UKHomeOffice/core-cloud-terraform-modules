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

resource "aws_kms_key" "default" {
  description         = var.description
  enable_key_rotation = var.rotation_enabled
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.alias}"
  target_key_id = aws_kms_key.default.key_id
}

resource "aws_kms_key_policy" "this" {
  count  = var.key_policy == null ? 0 : 1
  key_id = aws_kms_key.default.id
  policy = var.key_policy
}
