terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.39.0"
    }
  }
}

data "aws_identitystore_group" "identity_store_groups" {
  identity_store_id = var.identity_store_id
  
  alternate_identifier {
    unique_attribute {
      attribute_path  = "DisplayName"
      attribute_value = var.group_name
    }
  }
}

data "aws_identitystore_user" "identity_store_users" {
  for_each = toset(var.users)

  identity_store_id = var.identity_store_id

  alternate_identifier {
    unique_attribute {
      attribute_path  = "UserName"
      attribute_value = each.key
    }
  }
}

resource "aws_identitystore_group_membership" "group_membership" {
  for_each = toset(var.users)
  
  identity_store_id = var.identity_store_id
  group_id = data.aws_identitystore_group.identity_store_groups.id
  member_id = data.aws_identitystore_user.identity_store_users[each.key].id
}
