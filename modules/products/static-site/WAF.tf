resource "aws_wafv2_web_acl" "default" {
  name        = "cc-static-site-${var.product}-${var.component}"
  description = "Static Site WAF rule for ${var.product} ${var.component}"
  scope       = "REGIONAL"

  tags = local.common_tags

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "static-site-${var.product}-${var.component}"
    sampled_requests_enabled   = false
  }

}
