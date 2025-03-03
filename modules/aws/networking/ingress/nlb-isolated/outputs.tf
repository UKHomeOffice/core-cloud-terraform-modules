output "nlb_dns_name" {
  value = aws_lb.external_nlb.dns_name
  description = "The DNS name of the Network Load Balancer"
}
