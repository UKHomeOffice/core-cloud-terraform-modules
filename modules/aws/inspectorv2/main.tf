provider "aws" {
  alias  = "management"
  region = var.region
}

# Enable Inspector service & register Audit account as delegated admin (via CLI)
resource "null_resource" "org_prereqs" {
  provisioner "local-exec" {
    command = <<EOT
      aws organizations enable-aws-service-access --service-principal inspector2.amazonaws.com --region ${var.region}
      aws organizations register-delegated-administrator --account-id ${var.audit_account_id} --service-principal inspector2.amazonaws.com --region ${var.region}
    EOT
  }
}

# Register Audit account as delegated Inspector admin
resource "aws_inspector2_delegated_admin_account" "this" {
  account_id = var.audit_account_id

  depends_on = [null_resource.org_prereqs]
}

# Enable Inspector in Audit account (delegated admin)
resource "aws_inspector2_enabler" "enable_in_audit_account" {
  provider = aws.management

  account_ids    = [var.audit_account_id]
  resource_types = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]

  depends_on = [aws_inspector2_delegated_admin_account.this]
}

# Get all accounts in the AWS Organization
data "aws_organizations_organization" "this" {
  provider = aws.management
}

# Create list of active member accounts (excluding the management account)
locals {
  member_account_ids = [
    for acct in data.aws_organizations_organization.this.accounts :
    acct.id if acct.status == "ACTIVE" && acct.id != data.aws_organizations_organization.this.master_account_id
  ]
}

# Enable Inspector in all active member accounts
resource "aws_inspector2_enabler" "enable_in_member_accounts" {
  provider = aws.management

  account_ids    = local.member_account_ids
  resource_types = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]

  depends_on = [aws_inspector2_enabler.enable_in_audit_account]
}
