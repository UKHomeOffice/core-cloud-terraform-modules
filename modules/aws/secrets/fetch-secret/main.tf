# This module is for fetching the secrets in key:value format
data "aws_secretsmanager_secret" "secret" {
  name = var.secret_name 
}

data "aws_secretsmanager_secret_version" "secret" {
  secret_id = data.aws_secretsmanager_secret.secret.id
}

locals {
  secret_data = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)
}