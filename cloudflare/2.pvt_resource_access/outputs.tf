output "connector_token" {
  description = "The token used to run the cloudflared connector on your AWS VM"
  value       = data.cloudflare_zero_trust_tunnel_cloudflared_token.aws_vm_token.token
  sensitive   = true
}