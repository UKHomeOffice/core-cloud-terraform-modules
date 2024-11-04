# Outputs

output "alb_dns_name" {
  description = "The DNS name of the LB"
  value       = aws_lb.lb.dns_name
}

output "alb_security_group_id" {
  value = aws_security_group.sg.id
}