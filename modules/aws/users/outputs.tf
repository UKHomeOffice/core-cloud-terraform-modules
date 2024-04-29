output "identitystore_users" {
  value = { for k, v in aws_identitystore_user.identity_center_users : v.user_name => v.user_id }
}