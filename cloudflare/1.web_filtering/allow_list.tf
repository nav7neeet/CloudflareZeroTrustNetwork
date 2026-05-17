variable "allowed_domains" {
  description = "Domains explicitly allowed despite category blocks"
  type        = list(string)
  default = [
    "example.com",
  ]
}

resource "cloudflare_zero_trust_gateway_policy" "allow_domains_dns" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_allow_domains_dns"
  description = "Allow specific domains despite category blocks"
  precedence  = 4
  enabled     = true
  action      = "allow"
  filters     = ["dns"]
  traffic     = "any(dns.domains[*] in {${join(" ", formatlist("\"%s\"", var.allowed_domains))}})"
}

resource "cloudflare_zero_trust_gateway_policy" "allow_domains_http" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_allow_domains_http"
  description = "Allow specific domains despite category blocks"
  precedence  = 5
  enabled     = true
  action      = "allow"
  filters     = ["http"]
  traffic     = "any(http.request.domains[*] in {${join(" ", formatlist("\"%s\"", var.allowed_domains))}})"
}
