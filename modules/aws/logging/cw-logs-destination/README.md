<!-- BEGIN_TF_DOCS -->
  # Terraform Module for - creating cw-logs-destination
  # Example terragrunt.hcl inputs 
  ```hcl
inputs = {
  destination_name    = "cc-centralized-logs-destination"
  source_account_id   = "example-account-id"  # the account from which the logs originate 
  firehose_arn        = "arn:aws:firehose:eu-west-2:<firehose-aws-account-id>:deliverystream/splunk-firehose-fh-cw2splunk"
}
  ```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_destination.cw_logs_destination](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination) | resource |
| [aws_cloudwatch_log_destination_policy.cw_logs_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_destination_policy) | resource |
| [aws_iam_role.logs_destination_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.logs_destination_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS Region | `string` | `"eu-west-2"` | no |
| <a name="input_destination_name"></a> [destination\_name](#input\_destination\_name) | Name of the CloudWatch Logs destination | `string` | n/a | yes |
| <a name="input_firehose_arn"></a> [firehose\_arn](#input\_firehose\_arn) | ARN of the existing Firehose delivery stream | `string` | n/a | yes |
| <a name="input_source_account_id"></a> [source\_account\_id](#input\_source\_account\_id) | AWS Account ID of the source (management account X) | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cw_logs_destination_arn"></a> [cw\_logs\_destination\_arn](#output\_cw\_logs\_destination\_arn) | The ARN of the CloudWatch Logs Destination |
<!-- END_TF_DOCS -->