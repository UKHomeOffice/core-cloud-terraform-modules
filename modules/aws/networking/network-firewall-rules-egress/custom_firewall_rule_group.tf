resource "aws_networkfirewall_rule_group" "allow_domains_for_nonprod_01" {
  capacity    = 2000
  name        = "egress-allowed-domainlist-to-internet-01"
  description = "Allow egress internet access for Non-Production environment"
  type        = "STATEFUL"
  rule_group {
    stateful_rule_options {
      rule_order = "STRICT_ORDER"
    }
    rule_variables {
      ip_sets {
        key = "HOME_NET"
        ip_set {
          definition = [var.cidr_input]
        }
      }
    }
    rules_source {
      rules_source_list {
        generated_rules_type = "ALLOWLIST"
        target_types         = ["HTTP_HOST", "TLS_SNI"]
        targets = [
          for line in split("\n", (var.whitelisted_domains)) : trim(line, " \r")
        ]
      }
    }
  }
}
