

locals {
  common_tags = {
    COST_CENTRE = var.tags.COST_CENTRE
    PRODUCT     = var.tags.product
    COMPONENT   = var.tags.component
  }
}

provider "aws" {
  region = "us-east-1"
  alias  = "us-east-1"
}
