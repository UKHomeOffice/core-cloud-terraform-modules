resource "aws_organizations_policy" "ai_services_opt_out" {
  name        = var.policy_name
  description = var.policy_description
  type        = "AISERVICES_OPT_OUT_POLICY"
  content     = jsonencode({
      services = {
      "@@operators_allowed_for_child_policies" = [
        "@@none"
      ]
      default = {
        "@@operators_allowed_for_child_policies" = [
          "@@none"
        ]
        opt_out_policy = {
          "@@assign" = "optOut"
          "@@operators_allowed_for_child_policies" = [
            "@@none"
          ]
        }
      }
    }
   }
  )
}


resource "aws_organizations_policy_attachment" "ai_opt_out" {
  for_each = toset(var.apply_to_ous_or_accounts)

  policy_id = aws_organizations_policy.ai_services_opt_out.id
  target_id = each.value
}

