
variable "tenant" {
  description = "The tenant name"
  type        = string
}

# Define the variable
variable "apply_only" {
  type    = bool
  default = false
}