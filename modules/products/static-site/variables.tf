variable "tenant_vars" {
  type = any
}

variable "cloud_front_default_vars" {
  type = any
}

variable "aws_region" {
  type = string
}

variable "git_branch" {
  type        = string
  description = "git branches which can push to S3 from "

  validation {
    condition     = contains(var.git_branch, "main") || contains(var.git_branch, "master") || contains(var.git_branch, "CCL-509")
    error_message = "valid push branches are [main,master,CCL-509]"
  }
}
