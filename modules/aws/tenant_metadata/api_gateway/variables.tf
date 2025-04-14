
variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table"
  type        = string
}

variable "attributes_map" {
  description = "Map for attributes"
  type        = map(string)
}

variable "api_gateway_role_arn" {
  description = "The ARN of the API Gateway IAM role"
  type        = string
}

variable "aws_region" {
  description = "The ARN of the API Gateway IAM role"
  type        = string
  default     = "eu-west-2"
}

variable "kms_key" {
  description = "arn of KMS key used to encrypt CloudWatch logs"
  type        = string
}
