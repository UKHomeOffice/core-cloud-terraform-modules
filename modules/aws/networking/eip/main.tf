# Create an Elastic IP
resource "aws_eip" "this" {
  domain = "vpc"
  tags = var.tags
}

# outputs
output "eip_id" {
  value = aws_eip.this.id
}

output "eip_address" {
  value = aws_eip.this.public_ip
}

# variables
variable "tags" {
  description = "Tags to apply to the resources."
  type        = map(string)
  default     = {}
}
