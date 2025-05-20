variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "destination_name" {
  description = "Name of the CloudWatch Logs destination"
  type        = string
}

variable "source_account_id" {
  type = list(string)
  description = "List of AWS account IDs allowed to put subscription filters"
}

variable "firehose_arn" {
  description = "ARN of the existing Firehose delivery stream"
  type        = string
}
