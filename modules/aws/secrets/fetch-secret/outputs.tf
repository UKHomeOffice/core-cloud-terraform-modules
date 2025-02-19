output "hec_token" {
  value     = local.secret_data["splunk-hec-token"]
  sensitive = true
}