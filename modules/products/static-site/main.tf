

locals {
  common_tags = {
    COST_CENTRE = var.tenant_vars.COST_CENTRE
    PRODUCT     = var.tenant_vars.product
    COMPONENT   = var.tenant_vars.component
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}
