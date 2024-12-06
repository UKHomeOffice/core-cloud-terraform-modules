locals {
  accounts = yamldecode(file("${path_relative_to_include()}/accounts.yaml")).accounts
}

terraform {
  source = "../../ses"
}

inputs = {
  account_configs = local.accounts
}

provider "aws" {
  region = "eu-west-2"
}
