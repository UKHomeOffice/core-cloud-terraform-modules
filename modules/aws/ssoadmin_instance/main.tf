terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.39.0"
    }
  }
}

data "aws_ssoadmin_instances" "instance" {}
