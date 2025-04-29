provider "aws" {
  alias  = "management"
  region = var.region
}

# Determining the audit_account_id based on current running env
data "aws_caller_identity" "current" {}

locals {
  current_mgmt_id   = data.aws_caller_identity.current.account_id

  audit_account_id = local.current_mgmt_id == var.dev_lza_mgmt_id ? var.dev_audit_account_id : var.prod_audit_account_id
}

# Enable Inspector service & register Audit account as delegated admin (via CLI)
resource "null_resource" "org_prereqs" {
  provisioner "local-exec" {
    command = <<EOT
      aws organizations enable-aws-service-access --service-principal inspector2.amazonaws.com --region ${var.region}
      aws organizations register-delegated-administrator --account-id ${local.audit_account_id} --service-principal inspector2.amazonaws.com --region ${var.region}
    EOT
  }
}

# Register Audit account as delegated Inspector admin
resource "aws_inspector2_delegated_admin_account" "this" {
  provider   = aws.management
  account_id = local.audit_account_id

  depends_on = [null_resource.org_prereqs]
}

# Enable Inspector in Audit account (delegated admin)
resource "aws_inspector2_enabler" "enable_in_audit_account" {
  provider = aws.management

  account_ids    = [local.audit_account_id]
  resource_types = ["EC2", "ECR", "LAMBDA", "LAMBDA_CODE"]

  lifecycle {
    ignore_changes = [
      id
    ]
    create_before_destroy = true
  }

  depends_on = [aws_inspector2_delegated_admin_account.this]
}
