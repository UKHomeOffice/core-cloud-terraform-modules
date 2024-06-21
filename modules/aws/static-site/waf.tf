resource "aws_wafv2_web_acl" "default" {
  name        = "static-site-${var.tenant}-${var.service}-${var.env}"
  description = "Static Site WAF rule for ${var.tenant} ${var.service} - ${var.env}"
  scope       = "REGIONAL"

  default_action {
    allow {}
  }
}