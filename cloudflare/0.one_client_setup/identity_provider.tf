resource "cloudflare_zero_trust_access_identity_provider" "identity_provider" {
  name       = "${var.unique_id}_AWS_Cognito"
  type       = "oidc"
  account_id = var.cloudflare_account_id
  scim_config = {
    enabled                  = true
    identity_update_behavior = "automatic"
    seat_deprovision         = true
    user_deprovision         = true
  }

  config = {
    client_id        = var.oauth_client.client_id
    client_secret    = var.oauth_client.client_secret
    auth_url         = var.oauth_client.authorization_endpoint
    token_url        = var.oauth_client.token_endpoint
    certs_url        = var.oauth_client.jwks_endpoint
    scopes           = ["openid", "email", "profile"]
    email_claim_name = "email"
  }
}

## Access policy that allows access to users authenticated by AWS Cognito IdP
resource "cloudflare_zero_trust_access_policy" "access_policy" {
  account_id = var.cloudflare_account_id
  name       = "${var.unique_id}_allow_aws_cognito_users"
  # precedence = 1
  decision = "allow"

  include = [
    {
      login_method = {
        id = cloudflare_zero_trust_access_identity_provider.identity_provider.id
      }
    }
  ]
}
