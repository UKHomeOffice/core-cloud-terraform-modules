variable "accounts" {
  type = list(object({
    id = string
  }))
}

variable "management_account_id" {
  type = string
}

variable "policies" {
  type = map(list(string))
}

# Plan role (read-only)
module "andromeda_plan_roles" {
  for_each = { for account in var.accounts : account.id => account }

  source              = "../modules/iam_role"
  role_name           = "andromeda-plan-role-${each.key}"
  assume_role_policy  = data.aws_iam_policy_document.plan_assume_role_policy[each.key].json
  policies            = var.policies["andromeda-terraform-plan"]
}

# Apply role (full access)
module "andromeda_apply_roles" {
  for_each = { for account in var.accounts : account.id => account }

  source              = "../modules/iam_role"
  role_name           = "andromeda-apply-role-${each.key}"
  assume_role_policy  = data.aws_iam_policy_document.apply_assume_role_policy[each.key].json
  policies            = var.policies["andromeda-terraform-apply"]
}

data "aws_iam_policy_document" "plan_assume_role_policy" {
  for_each = { for account in var.accounts : account.id => account }

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.management_account_id}:role/andromeda-management-plan-role"]
    }
  }
}

data "aws_iam_policy_document" "apply_assume_role_policy" {
  for_each = { for account in var.accounts : account.id => account }

  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.management_account_id}:role/andromeda-management-apply-role"]
    }
  }
}
