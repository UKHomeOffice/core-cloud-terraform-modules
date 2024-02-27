terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.38.0"
    }
  }
}

resource "aws_identitystore_group" "identity_store_groups" {
  display_name      = var.group_name
  description       = var.group_description
  identity_store_id = var.identity_store_id
}
