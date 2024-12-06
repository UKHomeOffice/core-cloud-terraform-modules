# Terragrunt Configurations

This repository contains Terragrunt configurations for managing multiple AWS accounts using the SES IAM Role and Config module.

## Directory Structure

```plaintext
terragrunt/
   ├── dev/
   │    ├── accounts.yaml
   │    └── terragrunt.hcl
   ├── prod/
   │    ├── accounts.yaml
   │    └── terragrunt.hcl



## Accounts Configuration (accounts.yaml)

The `accounts.yaml` file contains the list of accounts and their roles for SES configuration.

## Environment-Specific Configurations

### dev

This environment uses the following configurations for SES roles and accounts:
- Account 1: `role1`, `role2`
- Account 2: `role1`

### prod

This environment uses a similar configuration but different accounts and roles.


```yaml
accounts:
  - name: account1
    role: role1
    account_id: "123456789012"
    ses_domain: "app1.np.core.homeoffice.gov.uk"
  - name: account2
    role: role2
    account_id: "234567890123"
    ses_domain: "app2.np.core.homeoffice.gov.uk"

### terragrunt.hcl

```hcl
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
