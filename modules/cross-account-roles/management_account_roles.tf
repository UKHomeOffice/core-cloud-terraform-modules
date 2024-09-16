
variable "accounts" {
  type = list(object({
    id = string
  }))
}

# Team Andromeda Management Roles
resource "aws_iam_role" "andromeda_management_plan_role" {
  name               = "andromeda-management-plan-role"
  assume_role_policy = data.aws_iam_policy_document.andromeda_plan_policy.json
}

resource "aws_iam_role" "andromeda_management_apply_role" {
  name               = "andromeda-management-apply-role"
  assume_role_policy = data.aws_iam_policy_document.andromeda_apply_policy.json
}

data "aws_iam_policy_document" "andromeda_plan_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [for account in var.accounts : "arn:aws:iam::${account.id}:role/andromeda-plan-role"]
    }
  }
}

data "aws_iam_policy_document" "andromeda_apply_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [for account in var.accounts : "arn:aws:iam::${account.id}:role/andromeda-apply-role"]
    }
  }
}

# Team Cosmos Management Roles
resource "aws_iam_role" "cosmos_management_plan_role" {
  name               = "cosmos-management-plan-role"
  assume_role_policy = data.aws_iam_policy_document.cosmos_plan_policy.json
}

resource "aws_iam_role" "cosmos_management_apply_role" {
  name               = "cosmos-management-apply-role"
  assume_role_policy = data.aws_iam_policy_document.cosmos_apply_policy.json
}

data "aws_iam_policy_document" "cosmos_plan_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [for account in var.accounts : "arn:aws:iam::${account.id}:role/cosmos-plan-role"]
    }
  }
}

data "aws_iam_policy_document" "cosmos_apply_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [for account in var.accounts : "arn:aws:iam::${account.id}:role/cosmos-apply-role"]
    }
  }
}

# Team Phoenix Management Roles
resource "aws_iam_role" "phoenix_management_plan_role" {
  name               = "phoenix-management-plan-role"
  assume_role_policy = data.aws_iam_policy_document.phoenix_plan_policy.json
}

resource "aws_iam_role" "phoenix_management_apply_role" {
  name               = "phoenix-management-apply-role"
  assume_role_policy = data.aws_iam_policy_document.phoenix_apply_policy.json
}

data "aws_iam_policy_document" "phoenix_plan_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [for account in var.accounts : "arn:aws:iam::${account.id}:role/phoenix-plan-role"]
    }
  }
}

data "aws_iam_policy_document" "phoenix_apply_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    principals {
      type        = "AWS"
      identifiers = [for account in var.accounts : "arn:aws:iam::${account.id}:role/phoenix-apply-role"]
    }
  }
}