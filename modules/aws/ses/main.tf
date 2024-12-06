# SES IAM Role and SES Configuration
resource "aws_iam_role" "ses_role" {
  for_each = { for account in var.account_configs : account.roles[0].role_name => account }

  name = each.value.roles[0].role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = { Service = "ec2.amazonaws.com" }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_policy" "ses_policy" {
  for_each = { for account in var.account_configs : account.roles[0].role_name => account }

  name        = each.value.roles[0].role_name
  description = "Policy for SES access"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ses:SendEmail", "ses:SendRawEmail"]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ses_policy_attachment" {
  for_each = { for account in var.account_configs : account.roles[0].role_name => account }

  role       = aws_iam_role.ses_role[each.key].name
  policy_arn = aws_iam_policy.ses_policy[each.key].arn
}

resource "aws_iam_instance_profile" "ses_instance_profile" {
  for_each = { for account in var.account_configs : account.roles[0].role_name => account }

  name = each.value.roles[0].role_name
  role = aws_iam_role.ses_role[each.key].name
}

resource "aws_ses_domain_identity" "ses_domain" {
  for_each = { for account in var.account_configs : account.roles[0].role_name => account }

  domain = each.value.roles[0].domain_name
}


#####
# NOTE: THESE MUST GO  INTO NETWORK ACCOUNT SO REQUEST THIS WITH ANDROMEDA - CROSS ACCOUNT ROLES DON't WORK 
#       SO THIS WOULD BE MANUAL


# resource "aws_route53_record" "ses_verification" {
#   count = var.create_route53_records ? 1 : 0
#   for_each = { for account in var.account_configs : account.roles[0].role_name => account }

#   zone_id = each.value.roles[0].route53_zone_id
#   name    = "_amazonses.${aws_ses_domain_identity.ses_domain[each.key].domain}"
#   type    = "TXT"
#   ttl     = 300
#   records = [aws_ses_domain_identity.ses_domain[each.key].verification_token]
# }

# resource "aws_route53_record" "ses_dkim" {
#   count = var.create_route53_records ? 3 : 0
#   for_each = { for account in var.account_configs : account.roles[0].role_name => account }

#   zone_id = each.value.roles[0].route53_zone_id
#   name    = lookup(aws_ses_domain_identity.ses_domain[each.key].dkim_tokens, count.index, "")
#   type    = "CNAME"
#   ttl     = 300
#   records = ["${lookup(aws_ses_domain_identity.ses_domain[each.key].dkim_tokens, count.index, "")}.amazonses.com"]
# }
