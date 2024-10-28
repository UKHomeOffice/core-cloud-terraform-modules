# Outputs

output "nlb_dns_name" {
  description = "The DNS name of the NLB"
  value       = aws_lb.lb.dns_name
}

# Output the private IP addresses of NLB ENIs

# output "nlb_private_ips_and_azs" {
#   value = [
#     for eni in data.aws_network_interface.lb_interface :
#     {
#       private_ip       = eni.private_ip,
#       availability_zone = eni.availability_zone
#     }
#   ]
# }

output "nlb_security_group_id" {
  value = aws_security_group.sg.id
}