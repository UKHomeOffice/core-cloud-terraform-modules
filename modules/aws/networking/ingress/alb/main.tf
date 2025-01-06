
output "workload_external_nlb_ips" {
  description = "List of External NLB IPs"
  value       = "${var.workload_external_nlb_ips}" 
}

output "workload_internal_nlb_ips" {
  description = "List of Internal NLB IPs"
  value       = "${var.workload_internal_nlb_ips}" 
}