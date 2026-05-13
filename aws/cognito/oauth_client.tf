resource "aws_cognito_user_pool_client" "oauth_client" {
  name         = "${var.unique_id}_user_pool_client"
  user_pool_id = aws_cognito_user_pool.user_pool.id

  generate_secret                      = true
  allowed_oauth_flows_user_pool_client = true
  supported_identity_providers         = ["COGNITO"]

  allowed_oauth_flows = ["code"]
  allowed_oauth_scopes = [
    "openid",
    "email",
    "profile",
    # "aws.cognito.signin.user.admin"
  ]

  explicit_auth_flows = ["ALLOW_REFRESH_TOKEN_AUTH"]

  token_validity_units {
    access_token  = "minutes"
    id_token      = "minutes"
    refresh_token = "days"
  }

  access_token_validity  = 60
  id_token_validity      = 60
  refresh_token_validity = 1

  callback_urls = [
    "https://${var.cloudflare_zero_trust_team_name}.cloudflareaccess.com/cdn-cgi/access/callback",
  ]
  logout_urls = var.logout_urls
}

resource "aws_cognito_user_pool_domain" "domain" {
  domain       = "${var.unique_id}-${random_string.random.id}"
  user_pool_id = aws_cognito_user_pool.user_pool.id
}
