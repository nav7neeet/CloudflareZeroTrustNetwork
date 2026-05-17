resource "cloudflare_zero_trust_gateway_logging" "gateway_logging" {
  account_id = var.cloudflare_account_id
  redact_pii = false

  settings_by_rule_type = {
    dns = {
      log_all    = true
      log_blocks = true
    }
    http = {
      log_all    = true
      log_blocks = true
    }
    l4 = {
      log_all    = true
      log_blocks = true
    }
  }
}

resource "cloudflare_zero_trust_gateway_certificate" "gateway_certificate" {
  account_id           = var.cloudflare_account_id
  validity_period_days = 365
  activate             = true
}

resource "cloudflare_zero_trust_gateway_settings" "gateway_settings" {
  account_id = var.cloudflare_account_id
  settings = {
    certificate = {
      id = cloudflare_zero_trust_gateway_certificate.gateway_certificate.id
    }
    tls_decrypt = {
      enabled = true
    }
    protocol_detection = {
      enabled = true
    }
    #inspection is applied on all ports
    inspection = {
      mode = "dynamic"
    }
  }
}

# Basically this is Cloudflare One Client settings on the user's device
resource "cloudflare_zero_trust_device_settings" "device_settings" {
  account_id                            = var.cloudflare_account_id
  gateway_proxy_enabled                 = true # required for http and network firewall policies
  gateway_udp_proxy_enabled             = true
  root_certificate_installation_enabled = true
}