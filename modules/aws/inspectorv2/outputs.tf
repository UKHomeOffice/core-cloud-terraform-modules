output "delegated_admin_account_id" {
  value = aws_inspector2_delegated_admin_account.this.account_id
}

output "enabled_member_accounts" {
  value = local.member_account_ids
}

