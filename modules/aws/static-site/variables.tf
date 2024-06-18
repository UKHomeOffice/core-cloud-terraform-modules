variable "tenant" {
  default = ""
}
variable "service" {
  default = ""
}
variable "env" {
  default = ""
}

variable "cost_center" {
  default = ""
}

variable "service_owner" {
  default = ""
}

variable "index_document" {
  default = "index.html"
}

variable "error_document" {
  default = "error.html"
}
variable "cloudfront_aliases" {
  type = list(string)
  default = []
}

variable "cloudfront_price_class" {
  default = "PriceClass_100"
}

variable "tenant_github_repo" {
}
