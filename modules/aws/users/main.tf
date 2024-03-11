terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0.0, < 6.0.0"
    }
  }
}

resource "aws_identitystore_user" "identity_center_users" {
  identity_store_id = var.identity_store_id
  
  display_name = "${var.given_name} ${var.family_name}"
  user_name    = var.user_name

  name {
    given_name  = var.given_name
    family_name = var.family_name
  }

  emails {
    primary = true
    value = var.email
  }
}
