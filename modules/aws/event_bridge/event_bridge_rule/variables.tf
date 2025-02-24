variable "create_event_bus" {
  type        = bool
  description = "whether to create event-bus or not: true or false"
}

variable "event_rule_name" {
  description = "Name of the EventBridge rule"
  type        = string
}

variable "event_rule_description" {
  description = "Description of the EventBridge rule"
  type        = string
}

variable "event_bus_name" {
  description = "Event bus name where rule is created"
  type        = string
}

variable "event_sources" {
  description = "Event sources to match in the event pattern"
  type        = list(string)
}

variable "target_arn" {
  description = "ARN of the target for the event rule"
  type        = string
}

variable "role_name" {
  description = "IAM Role name for EventBridge"
  type        = string
}

variable "role_actions" {
  description = "List of actions the IAM Role should allow"
  type        = list(string)
}
