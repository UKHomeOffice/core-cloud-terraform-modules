resource "aws_backup_vault" "this" {
  name        = var.name
  tags        = var.tags
  kms_key_arn = try(var.backup_vault_kms_key_arn, null)
}

# Created if the policy JSON is supplied.
resource "aws_backup_vault_policy" "this" {
  count             = var.backup_vault_policy_json != "" ? 1 : 0
  backup_vault_name = aws_backup_vault.this.name
  policy            = var.backup_vault_policy_json
}

resource "aws_backup_global_settings" "this" {
  count = var.enable_cross_account_backup == true ? 1 : 0
  global_settings = {
    "isCrossAccountBackupEnabled" = "true"
  }
}
