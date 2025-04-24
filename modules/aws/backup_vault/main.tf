# refactored modules to create CMEK for backup-vault
data "aws_caller_identity" "self" {}

data "aws_iam_policy_document" "cmek" {
  version = "2012-10-17"

  statement {
    sid    = "Enable IAM User Permissions"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.self.account_id}:root"]
    }
    actions   = ["kms:*"]
    resources = [aws_kms_key.cmek.arn]
  }

  statement {
    sid    = "Allow alias creation during setup"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${data.aws_caller_identity.self.account_id}:role/AWSAccelerator-Terragrunt-Bootstrapping-Apply-Role"]
    }
    actions   = ["kms:CreateAlias"]
    resources = [aws_kms_key.cmek.arn]
  }

  statement {
    sid    = "Allow use of the key by authorized Backup vault account"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::${var.backup_account_id}:root"]
    }
    actions = [
      "kms:DescribeKey",
      "kms:Encrypt",
      "kms:Decrypt",
      "kms:CreateGrant",
      "kms:ReEncrypt*",
      "kms:GenerateDataKey*",
      "kms:GenerateDataKeyWithoutPlaintext",
    ]
    resources = [aws_kms_key.cmek.arn]
    condition {
      test     = "ForAnyValue:StringLike"
      values   = ["${var.org_id}/*"]
      variable = "aws:PrincipalOrgPaths"
    }
  }

  statement {
    sid    = "Allow attachment of persistent resources"
    effect = "Allow"
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    actions = [
      "kms:CreateGrant",
      "kms:ListGrants",
      "kms:RevokeGrant",
    ]
    resources = [aws_kms_key.cmek.arn]
    condition {
      test     = "Bool"
      variable = "kms:GrantIsForAWSResource"
      values   = ["true"]
    }
    condition {
      test     = "ForAnyValue:StringLike"
      values   = ["${var.org_id}/*"]
      variable = "aws:PrincipalOrgPaths"
    }
  }
}


#
resource "aws_kms_key" "cmek" {
  description             = "CMK for Backup Vault ${var.name}"
  enable_key_rotation     = var.kms_key_enable_rotation
  deletion_window_in_days = var.kms_key_deletion_window_days
  policy                  = data.aws_iam_policy_document.cmek.json
  tags                    = var.tags
}

resource "aws_kms_alias" "cmek_alias" {
  name          = "alias/${var.kms_key_alias != "" ? var.kms_key_alias : var.name}-key"
  target_key_id = aws_kms_key.cmek.key_id
}

resource "aws_backup_vault" "this" {
  name        = var.name
  tags        = var.tags
  kms_key_arn = aws_kms_key.cmek.arn
}

resource "aws_backup_vault_policy" "this" {
  count             = length(var.backup_vault_policy_json) > 0 ? 1 : 0
  backup_vault_name = aws_backup_vault.this.name
  policy            = var.backup_vault_policy_json
}
