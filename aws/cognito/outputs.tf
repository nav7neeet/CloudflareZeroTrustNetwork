output "oauth_client" {
  description = "oauth client details required for configuring identity provider in cloudflare"
  value = {
    client_id              = aws_cognito_user_pool_client.oauth_client.id
    client_secret          = aws_cognito_user_pool_client.oauth_client.client_secret
    authorization_endpoint = "https://${aws_cognito_user_pool_domain.domain.domain}.auth.${data.aws_region.current.region}.amazoncognito.com/oauth2/authorize"
    token_endpoint         = "https://${aws_cognito_user_pool_domain.domain.domain}.auth.${data.aws_region.current.region}.amazoncognito.com/oauth2/token"
    jwks_endpoint          = "https://cognito-idp.${data.aws_region.current.region}.amazonaws.com/${aws_cognito_user_pool.user_pool.id}/.well-known/jwks.json"
    sensitive              = true
  }
}

output "password" {
  description = "password for aws cognito users. for simplicity its the same for all users."
  value       = random_password.user_password.result
  sensitive   = true
}
