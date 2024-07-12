

locals {
  common_tags = {
    COST_CENTRE = var.tags.COST_CENTRE
    PRODUCT     = var.tags.product
    COMPONENT   = var.tags.component
  }
}
