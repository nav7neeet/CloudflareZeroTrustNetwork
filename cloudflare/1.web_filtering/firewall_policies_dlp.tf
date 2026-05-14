data "cloudflare_zero_trust_dlp_predefined_profile" "ssn" {
  account_id = var.cloudflare_account_id
  profile_id = "d658f520-6ecb-4a34-a725-ba37243c2d28"
}

resource "cloudflare_zero_trust_gateway_policy" "block_ssn_upload" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_block_ssn_uploads_policy"
  description = "Block HTTP traffic containing Social Security Numbers"
  precedence  = 40
  action      = "block"
  enabled     = var.dlp_policy
  filters     = ["http"]
  traffic     = "any(dlp.profiles[*] in {\"${data.cloudflare_zero_trust_dlp_predefined_profile.ssn.id}\"})"
}