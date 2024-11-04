# Outputs

output "nlb_dns_name" {
  description = "The DNS name of the NLB"
  value       = aws_lb.lb.dns_name
}

output "nlb_security_group_id" {
  value = aws_security_group.sg.id
}