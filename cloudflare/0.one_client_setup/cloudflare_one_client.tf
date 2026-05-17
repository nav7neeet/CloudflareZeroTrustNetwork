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

resource "cloudflare_zero_trust_device_custom_profile" "custom_profile" {
  enabled               = var.one_client_custom_profile
  account_id            = var.cloudflare_account_id
  match                 = "identity.email != \"\""
  description           = "custom device profile to control cloudflare one client settings"
  name                  = "${var.unique_id}_custom_device_profile"
  precedence            = 100
  allow_mode_switch     = true
  allow_updates         = false
  allowed_to_leave      = true
  disable_auto_fallback = true
  switch_locked         = true
  auto_connect          = 0
  captive_portal        = 180

  exclude = [
    {
      address     = "100.64.0.0/10"
      description = "Carrier-Grade NAT (RFC 6598)"
    },
    {
      address     = "169.254.0.0/16"
      description = "DHCP Unspecified"
    },
    {
      address     = "172.16.0.0/12"
      description = "Private Network (RFC 1918)"
    },
    {
      address     = "192.0.0.0/24"
      description = "IETF Protocol Assignments (RFC 6890)"
    },
    {
      address     = "192.168.0.0/16"
      description = "Private Network (RFC 1918)"
    },
    {
      address     = "224.0.0.0/24"
      description = "Local Network Control Block (IANA)"
    },
    {
      address     = "240.0.0.0/4"
      description = "Reserved for Future Use (RFC 1112)"
    },
    {
      address     = "255.255.255.255/32"
      description = "DHCP Broadcast"
    },
    {
      address     = "fe80::/10"
      description = "IPv6 Link Local"
    },
    {
      address     = "fd00::/8"
      description = "IPv6 Unique Local Address (ULA)"
    },
    {
      address     = "ff01::/16"
      description = "IPv6 Interface-Local Multicast"
    },
    {
      address     = "ff02::/16"
      description = "IPv6 Link-Local Multicast"
    },
    {
      address     = "ff03::/16"
      description = "IPv6 Realm-Local Multicast"
    },
    {
      address     = "ff04::/16"
      description = "IPv6 Admin-Local Multicast"
    },
    {
      address     = "ff05::/16"
      description = "IPv6 Site-Local Multicast"
    },
  ]
  service_mode_v2 = {
    mode = "warp"
  }
  tunnel_protocol = "wireguard"
  support_url     = "https://blog.mishraji.org/"
}
