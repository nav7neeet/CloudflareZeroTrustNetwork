output "user_credentials" {
  description = "credentials for aws cognito users. for simplicity password is the same for all users."
  value       = module.cognito.user_credentials
  sensitive   = true
}

# output "connector_token" {
#   description = "cloudflare connector token"
#   value       = module.cloudflare_pvt_resource_access.connector_token
#   sensitive   = true
# }