output "hec_token" {
  value     = local.secret_data["splunk-hec-token"]
  sensitive = true
}

output "security_hub_alert_webhook" {
  value     = local.secret_data["webhook"]
  sensitive = true
}
