#---------------DNS Policy------------------
resource "cloudflare_zero_trust_gateway_policy" "dns_policy" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_dns_policy"
  description = "Block access to restricted sites"
  precedence  = 10
  enabled     = var.dns_policy
  action      = "block"
  filters     = ["dns"]
  traffic     = "any(dns.security_category[*] in {${join(" ", values(var.content_categories))}})"
}

#---------------HTTP Policy------------------
resource "cloudflare_zero_trust_gateway_policy" "http_policy" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_http_policy"
  description = "Block access to restricted sites"
  precedence  = 20
  enabled     = var.http_policy
  action      = "block"
  filters     = ["http"]
  traffic     = "any(http.request.uri.content_category[*] in {${join(" ", values(var.content_categories))}})"
}

#---------------For Network Policy------------------

resource "cloudflare_zero_trust_list" "malicious_ips" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_malicious_ips"
  description = "A list of malicious ip address taken from open source projects"
  type        = "IP"
  items = [{
    description = "My IP for testing purpose"
    value       = chomp(data.http.my_ip.response_body)
  }]
}

resource "cloudflare_zero_trust_gateway_policy" "network_policy" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_network_policy"
  description = "Block known malicious IPs from Feodo Tracker"
  precedence  = 30
  enabled     = var.network_policy
  action      = "block"
  filters     = ["l4"]
  # traffic     = "net.dst.ip in {${join(" ", local.space_separated_ips)}}"
  traffic = "net.dst.ip in {${chomp(data.http.my_ip.response_body)} }"
}

