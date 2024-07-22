variable "policy_name" {
  description = "The name of the AI services opt-out policy"
  type        = string
  default     = "AIServicesOptOutPolicy"
}

variable "policy_description" {
  description = "The description of the AI services opt-out policy"
  type        = string
  default     = "Policy to opt out of AI services"
}

variable "apply_to_ous_or_accounts" {
  type        = list(string)
  description = "A list of AWS Organization OU IDs or AWS Account IDs that should have the Policies applied (can be empty)."
  default     = []
}
