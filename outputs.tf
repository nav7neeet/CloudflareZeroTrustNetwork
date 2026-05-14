output "password" {
  description = "password for aws cognito users. for simplicity its the same for all users."
  value       = module.cognito.password
  sensitive   = true
}

# output "connector_token" {
#   description = "cloudflare connector token"
#   value       = module.cloudflare_pvt_resource_access.connector_token
#   sensitive   = true
# }