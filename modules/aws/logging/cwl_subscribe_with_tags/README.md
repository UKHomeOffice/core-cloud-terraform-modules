<!-- BEGIN_TF_DOCS -->
# CloudWatch Logs Subscribe With Tags

A terraform module that creates an EventBridge rule which listens for tag changes on Cloud Watch log groups.

If a tag matching a user-defined pattern is found, and the tag value matches the "opt-in" user-defined pattern, then
a subscription filter will be added to the Log Group in order to forward the logs to a user-defined destination.

A good use-case for this module is to selectively forward certain logs to a Kinesis stream for onward ingestion into Splunk,
or to ensure that certain logs get forwarded to a destination for long-term S3 archival.

## Example usage
```hcl
module "cwl-subscribe-with-tag" {
  source                          = "./cwl-subscribe-with-tag"
  name                            = "send-to-splunk"
  tag_pattern                     = "splunk"
  cloudwatch_logs_destination_arn = aws_cloudwatch_log_destination.kinesis.arn
}
```
## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | 2.6.0 |
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.54.1 |
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.this](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.this](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_log_group.this](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/cloudwatch_log_group) | resource |
| [aws_iam_policy.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/iam_policy) | resource |
| [aws_iam_policy.lambda_code](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/iam_policy) | resource |
| [aws_iam_role.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/iam_role) | resource |
| [aws_iam_role.lambda_code](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_code](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.this](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/lambda_function) | resource |
| [aws_lambda_permission.this](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/resources/lambda_permission) | resource |
| [archive_file.this](https://registry.terraform.io/providers/hashicorp/archive/2.6.0/docs/data-sources/file) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.lambda](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda-assume](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda_code](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.lambda_code_assume](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/5.54.1/docs/data-sources/region) | data source |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloudwatch_logs_destination_arn"></a> [cloudwatch\_logs\_destination\_arn](#input\_cloudwatch\_logs\_destination\_arn) | The Arn of the CloudWatch logs destination. | `string` | n/a | yes |
| <a name="input_log_retention_in_days"></a> [log\_retention\_in\_days](#input\_log\_retention\_in\_days) | The number of days retention for lambda CloudWatch log group. | `number` | `731` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the lambda function and subscription filter. | `string` | n/a | yes |
| <a name="input_opt_in_tag_value"></a> [opt\_in\_tag\_value](#input\_opt\_in\_tag\_value) | The tag value which indicates opting-in. | `string` | `"true"` | no |
| <a name="input_opt_out_tag_value"></a> [opt\_out\_tag\_value](#input\_opt\_out\_tag\_value) | The tag value which indicates opting-out. | `string` | `"false"` | no |
| <a name="input_tag_pattern"></a> [tag\_pattern](#input\_tag\_pattern) | The tag pattern to match on. | `string` | n/a | yes |

<!-- END_TF_DOCS -->