## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.ses_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_policy.ses_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.ses_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ses_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_route53_record.ses_dkim](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ses_verification](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_ses_domain_identity.ses_domain](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ses_domain_identity) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_configs"></a> [account\_configs](#input\_account\_configs) | List of accounts and their roles to configure SES | <pre>list(object({<br>    name  = string<br>    roles = list(object({<br>      role_name        = string<br>      domain_name      = string<br>      route53_zone_id  = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_create_route53_records"></a> [create\_route53\_records](#input\_create\_route53\_records) | Flag to create Route 53 DNS records for SES | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dkim_tokens"></a> [dkim\_tokens](#output\_dkim\_tokens) | DKIM tokens for SES |
| <a name="output_iam_policy_arn"></a> [iam\_policy\_arn](#output\_iam\_policy\_arn) | IAM policy ARNs for SES |
| <a name="output_iam_role_name"></a> [iam\_role\_name](#output\_iam\_role\_name) | IAM role names for SES |
| <a name="output_instance_profile_name"></a> [instance\_profile\_name](#output\_instance\_profile\_name) | Instance profile names |
| <a name="output_ses_domain_verification_token"></a> [ses\_domain\_verification\_token](#output\_ses\_domain\_verification\_token) | SES domain verification tokens |
