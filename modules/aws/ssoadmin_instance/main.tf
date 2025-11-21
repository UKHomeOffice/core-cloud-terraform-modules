terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0, < 6.22.2"
    }
  }
}

data "aws_ssoadmin_instances" "instance" {}
