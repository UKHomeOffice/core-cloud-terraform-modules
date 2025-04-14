locals {
  logs_bucket = "aws-accelerator-s3-access-logs-${data.aws_caller_identity.current.account_id}-${data.aws_region.current.name}"
}
