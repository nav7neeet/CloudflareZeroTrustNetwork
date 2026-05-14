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

## creates a Cloudflare One Client application
## Notes - Both allowed_idps and the polcies are required. I felt policies should be sufficient as I have already mentioned the IDP in the policy but I was wrong!
resource "cloudflare_zero_trust_access_application" "cloudflare_one_client" {
  account_id                = var.cloudflare_account_id
  type                      = "warp"
  name                      = "${var.unique_id}_cloudflare_one_client"
  allowed_idps              = [cloudflare_zero_trust_access_identity_provider.identity_provider.id]
  auto_redirect_to_identity = true

  policies = [
    {
      id         = cloudflare_zero_trust_access_policy.access_policy.id
      precedence = 1
    }
  ]
}

