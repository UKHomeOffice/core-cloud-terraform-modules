resource "aws_organizations_policy" "mandatory_tag_policy" {
  name        = var.policy_name
  description = var.policy_description
  type        = "TAG_POLICY"
  content = file(
    "./enforce_mandatory_tag_values.template",
  )
}


resource "aws_organizations_policy_attachment" "mandatory_tags" {
  policy_id = aws_organizations_policy.mandatory_tag_policy.id
  target_id = aws_organizations_organization.mandatory_tag_policy.roots[0].id
}

