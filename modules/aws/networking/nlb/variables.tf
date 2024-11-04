# Load Balancer related

variable "vpc_id" {
  type        = string
  description = "VPC ID where NLB will be deployed"
}

variable "subnets" {
  type        = list(string)
  description = "Subnets where NLB will be deployed"
}

variable "certificate_arn" {
  type        = string
  description = "ARN of the SSL certificate for HTTPS listener"
}

variable "target_type" {
  type        = string
  description = "Allowed values: ip or instance or alb"   
}

variable "tg_port" {
  type        = string
  description = "target group port"
}

variable "tg_protocol" {
  type        = string
  description = "target group protocol"
}

variable "access_logs_bucket" {
  type        = string
  description = "S3 bucket for NLB access logs"
}

variable "enable_deletion_protection" {
  type        = string
  description = "enable_deletion_protection true or false"
}

variable "load_balancer_type" {
  type        = string
  description = "load_balancer_type - network or application"
}

variable "load_balancer_internal" {
  type        = string
  description = "load_balancer_internal - true or false"
}

variable "name" {
  type        = string
  description = "Name of the resource/component"
}

variable "prefix" {
  type        = string
  description = "prefix for the resource/component"
}

variable "instance_targets" {
  description = "Map of instance IDs to availability zones for target group attachment"
  type        = map(string)
  # Example:
  # instance_targets = {
  #   "i-0123456789abcdef0" = "eu-west-2a",
  #   "i-0123456789abcdef1" = "eu-west-2b",
  #   "i-0123456789abcdef2" = "eu-west-2c"
  # }
}

# SG related 

variable "ingress_rules" {
  description = "A list of ingress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks  = list(string)
    description = string
  }))
}

variable "egress_rules" {
  description = "A list of egress rules"
  type        = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks  = list(string)
    description = string
  }))
}
