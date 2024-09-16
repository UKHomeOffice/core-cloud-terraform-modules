# modules/iam_role.tf

variable "role_name" {
  description = "The name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "The assume role policy for the IAM role"
  type        = string
}

variable "policies" {
  description = "List of policies to attach to the role"
  type        = list(string)
}

resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy_attachment" "attachments" {
  count     = length(var.policies)
  role      = aws_iam_role.this.name
  policy_arn = var.policies[count.index]
}
