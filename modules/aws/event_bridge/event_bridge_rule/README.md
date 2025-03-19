<!-- BEGIN_TF_DOCS -->
# Terraform Module - Event Bridge Rule

A terraform module that creates an EventBridge rule which listens for matched security-hub events and forward them to the event-bus in another account.
If a matching pattern is found (based on ["aws.securityhub"]), then the event will be forwarded to the given target.

A good use-case for this module is to selectively forward security-hub findings to an event-bus in LogArchive Account wheree it will be further sent to Kinesis Firehose stream for onward ingestion into Splunk.

    Example usage: terragrunt.hcl

    ```hcl
    inputs = {
      create_event_bus      = false
      event_bus_name        = "default"
      event_rule_name        = "CoreCloudForwardSecurityHubToLogArchive"
      event_rule_description = "Forward Security Hub findings from Audit to Log Archive"
      event_sources          = ["aws.securityhub"]
      target_arn             = "arn:aws:events:eu-west-2:968840656855:event-bus/cc-firehose-splunk" # event-bus as target
      role_name              = "CoreCloudEventBridgeForwarderRole"
      role_actions           = ["events:PutEvents"]
    }
    ``` 

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.81.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.81.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_bus.custom_event_bus](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/cloudwatch_event_bus) | resource |
| [aws_cloudwatch_event_bus_policy.this](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/cloudwatch_event_bus_policy) | resource |
| [aws_cloudwatch_event_rule.event_rule](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.event_target](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/cloudwatch_event_target) | resource |
| [aws_iam_role.eventbridge_role](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.eventbridge_policy](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/resources/iam_role_policy) | resource |
| [aws_iam_policy_document.this](https://registry.terraform.io/providers/hashicorp/aws/5.81.0/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_event_bus"></a> [create\_event\_bus](#input\_create\_event\_bus) | whether to create event-bus or not: true or false | `bool` | n/a | yes |
| <a name="input_event_bus_name"></a> [event\_bus\_name](#input\_event\_bus\_name) | Event bus name where rule is created | `string` | n/a | yes |
| <a name="input_event_rule_description"></a> [event\_rule\_description](#input\_event\_rule\_description) | Description of the EventBridge rule | `string` | n/a | yes |
| <a name="input_event_rule_name"></a> [event\_rule\_name](#input\_event\_rule\_name) | Name of the EventBridge rule | `string` | n/a | yes |
| <a name="input_event_sources"></a> [event\_sources](#input\_event\_sources) | Event sources to match in the event pattern | `list(string)` | n/a | yes |
| <a name="input_role_actions"></a> [role\_actions](#input\_role\_actions) | List of actions the IAM Role should allow | `list(string)` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | IAM Role name for EventBridge | `string` | n/a | yes |
| <a name="input_source_account_id"></a> [source\_account\_id](#input\_source\_account\_id) | The source AWS Account ID where events are forwarded from | `string` | `""` | no |
| <a name="input_target_arn"></a> [target\_arn](#input\_target\_arn) | ARN of the target for the event rule | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_event_bus_arn"></a> [event\_bus\_arn](#output\_event\_bus\_arn) | ARN of the created EventBridge Event-Bus |
| <a name="output_event_rule_arn"></a> [event\_rule\_arn](#output\_event\_rule\_arn) | ARN of the created EventBridge rule |
| <a name="output_event_target_arn"></a> [event\_target\_arn](#output\_event\_target\_arn) | ARN of the EventBridge target |
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | ARN of the IAM role used by EventBridge |
<!-- END_TF_DOCS -->