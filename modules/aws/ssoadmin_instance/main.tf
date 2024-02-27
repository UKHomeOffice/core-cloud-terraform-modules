terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.37.0"
    }
  }
}

data "aws_ssoadmin_instances" "instance" {}
