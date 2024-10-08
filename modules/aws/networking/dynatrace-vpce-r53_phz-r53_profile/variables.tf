variable "vpc_id" {
  description = "The ID of the VPC in which the endpoint will be used"
  type        = string
}

variable "dynatrace_r53_records" {
  description = "A map of route53 records to generate when provided a map of logical and actual dynatrace environments e.g. {test = nuh63189}"
  type        = map(string)
  default     = {}
}

variable "service_name" {
  description = "The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service>"
  type        = string
}

variable "security_group_ids" {
  description = "The ID of one or more security groups to associate with the network interface. Applicable for endpoints of type Interface. If no security groups are specified, the VPC's default security group is associated with the endpoint."
  type        = list(string)
  default     = []
}

variable "subnet_ids" {
  description = "The ID of one or more subnets in which to create a network interface for the endpoint."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}
