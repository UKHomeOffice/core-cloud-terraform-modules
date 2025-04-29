# check mark the flag - To automatically activate Inspector for new member accounts
resource "aws_inspector2_organization_configuration" "this" {
  auto_enable {
    ec2         = true
    ecr         = true
    lambda      = true
    lambda_code = true
  }
}

# Get all accounts in the AWS Organization
data "aws_organizations_organization" "this" {}

# Get the current AWS Account ID
data "aws_caller_identity" "current" {}

# Create list of active member accounts
locals {
  active_member_account_ids = [
    for acct in data.aws_organizations_organization.this.accounts :
    acct.id
    if acct.status == "ACTIVE"
    && acct.id != data.aws_organizations_organization.this.master_account_id
    && acct.id != data.aws_caller_identity.current.account_id
  ]
}

# Associate all active member accounts (if not already associated)
resource "aws_inspector2_member_association" "associate_members" {
  for_each = toset(local.active_member_account_ids)

  account_id = each.value

  lifecycle {
    ignore_changes = [
      # Ignore changes to account_id to prevent unnecessary updates
      account_id
    ]
  }
}