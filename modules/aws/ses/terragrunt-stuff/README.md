# Terragrunt Configurations

This repository contains Terragrunt configurations for managing multiple AWS accounts using the SES IAM Role and Config module.

## Accounts Configuration (accounts.yaml)

The `accounts.yaml` file contains the list of accounts and their roles for SES configuration.

## Environment-Specific Configurations

### dev

This environment uses the following configurations for SES roles and accounts:
- Account 1: `role1`, `role2`
- Account 2: `role1`

### prod

This environment uses a similar configuration but different accounts and roles.
