output "identitystore_groups" {
  value = { for k, v in aws_identitystore_group.identity_store_groups : v.display_name => v.id }
}