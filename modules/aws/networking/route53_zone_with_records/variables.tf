variable "vpc_id" {
  description = "A list of VPCs to associate the Route53 Zone with - setting this will create a Private Hosted Zone (PHZ)"
  type        = list(string)
  default     = []
}

variable "r53_zone" {
  description = "The name of the Route53 Zone. e.g example.com"
  type        = string
}

variable "r53_records_as_json" {
  description = "A JSON encoded String of the records for the Route53 Zone you wish to create, please see example for usage. It's JSON encoded due to Terragrunt Bug - https://github.com/gruntwork-io/terragrunt/issues/1211"
  type        = string
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
