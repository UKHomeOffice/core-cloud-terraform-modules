variable "api_gateway_role_arn" {}
variable "dynamodb_table_name" {}

variable "attributes_map" {
  type        = map(string)
  description = "Mapping of attribute names to their JSON path keys"
}