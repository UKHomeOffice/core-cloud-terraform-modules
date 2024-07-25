resource "aws_wafv2_web_acl" "default" {
  name        = "cc-static-site-${var.tags.product}-${var.tags.component}"
  description = "Static Site WAF rule for ${var.tags.product} ${var.tags.component}"
  scope       = "CLOUDWATCH"

  tags = local.common_tags

  default_action {
    allow {}
  }

  visibility_config {
    cloudwatch_metrics_enabled = false
    metric_name                = "static-site-${var.tags.product}-${var.tags.component}"
    sampled_requests_enabled   = false
  }

}
