locals {
  raw_lines = split("\n", var.rules_vars_file)

  valid_lines = [
    for line in local.raw_lines :
    trim(line, " ")
    if can(regex("^\\s*[^=\\s]+\\s*=\\s*\\[.*\\]\\s*$", line)) && length(trim(line, " ")) > 0
  ]

  ip_sets = [
    for line in local.valid_lines : {
      key   = trim(regex("^([^=]+)=", line)[0], " ")
      cidrs = [
        for cidr in split(",", replace(regex("=\\[(.*)\\]", line)[0], "=[", "")) :
        trim(replace(cidr, "]", ""), " ")
      ]
    }
  ]
}



resource "aws_networkfirewall_rule_group" "main_rules" {
  name     = "${var.network_firewall_name}-base-rules"
  capacity = 5000
  type     = "STATEFUL"

  rule_group {
    rule_variables {
      dynamic "ip_sets" {
        for_each = local.ip_sets
        content {
          key = ip_sets.value.key
          ip_set {
            definition = ip_sets.value.cidrs
          }
        }
      }
    }

    rules_source {
      rules_string = var.rules_file
    }

    stateful_rule_options {
      rule_order = "STRICT_ORDER"
    }
  }
}
