variable "name" {
  description = "Name of the Backup Vault"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
}
