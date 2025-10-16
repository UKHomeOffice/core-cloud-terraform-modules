terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0, < 6.17.1"
    }
  }
}

data "aws_ssoadmin_instances" "instance" {}
