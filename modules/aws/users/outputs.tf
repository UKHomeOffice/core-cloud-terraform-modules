output "identitystore_user_id" {
  value = {aws_identitystore_user.identity_center_users.user_name=>aws_identitystore_user.identity_center_users.id}
}
