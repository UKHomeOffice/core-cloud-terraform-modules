output "instance" {
  description = "The AWS SSO instance to create the group in."
  value = {
    id   = tolist(data.aws_ssoadmin_instances.instance.identity_store_ids)[0]
    arn  = tolist(data.aws_ssoadmin_instances.instance.arns)[0]
  }
}
