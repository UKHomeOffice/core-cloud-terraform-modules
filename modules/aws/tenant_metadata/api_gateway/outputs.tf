output "api_gateway_invoke_url" {
  value = aws_api_gateway_stage.prod.invoke_url
}
