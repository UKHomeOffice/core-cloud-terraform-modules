resource "aws_networkfirewall_rule_group" "main_rules" {
  capacity = 5000
  name     = "${var.network_firewall_name}-base-rules"
  type     = "STATEFUL"

  rule_group {
    rules_source {
      #rules_string = file("${path.module}/rules.txt")
      rules_string = var.rules_file
    }

    stateful_rule_options {
      rule_order = "STRICT_ORDER"
    }
  }
}
