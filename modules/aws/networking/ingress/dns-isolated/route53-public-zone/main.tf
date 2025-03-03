
# Define a local map for conditional execution
locals {
  nlb_map = var.apply_only ? { "nlb" = "${var.nlb_name}-external" } : {}
}

# Lookup NLB only if apply_only = true
data "aws_lb" "existing_nlb" {
  for_each = local.nlb_map
  name     = each.value
}

# Create Route53 A Record Alias for External NLB (Only If NLB Exists)
resource "aws_route53_record" "external_nlb" {
  count   = length(local.nlb_map) > 0 ? 1 : 0
  zone_id = var.hosted_zone_id # This is for the Route 53 hosted zone
  name    = "*.${var.domain_name}"
  type    = "A"

  alias {
    name                   = try(data.aws_lb.existing_nlb["nlb"].dns_name, "")
    zone_id                = try(data.aws_lb.existing_nlb["nlb"].zone_id, "") # Extracted from NLB, not var.hosted_zone_id
    evaluate_target_health = true
  }
}

# Output the resolved NLB DNS Name & Hosted Zone ID (Avoid Failure If Missing)
output "nlb_dns_name" {
  value = length(local.nlb_map) > 0 ? try(data.aws_lb.existing_nlb["nlb"].dns_name, "NLB not found") : "NLB not found"
}

output "nlb_hosted_zone_id" {
  value = length(local.nlb_map) > 0 ? try(data.aws_lb.existing_nlb["nlb"].zone_id, "Hosted Zone ID not found") : "Hosted Zone ID not found"
}
