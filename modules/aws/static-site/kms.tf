resource "aws_kms_key" "default" {
  enable_key_rotation = true
  tags = {
    Tenant       = var.tenant
    Service      = var.service
    Environment  = var.env
    CostCenter   = var.cost_center
    ServiceOwner = var.owner
  }
}