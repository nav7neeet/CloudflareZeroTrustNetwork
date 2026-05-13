resource "random_password" "tunnel_secret" {
  length = 64
}

resource "cloudflare_zero_trust_tunnel_cloudflared" "tunnel" {
  account_id    = var.cloudflare_account_id
  name          = "${var.unique_id}_aws_tunnel"
  tunnel_secret = base64encode(random_password.tunnel_secret.result)
  config_src    = "cloudflare" # This allows dashboard/remote management
}

data "cloudflare_zero_trust_tunnel_cloudflared_token" "aws_vm_token" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
}

resource "cloudflare_zero_trust_tunnel_cloudflared_route" "vpc_route" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id
  network    = "10.0.0.0/16"
  comment    = ""
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "tunnel_config" {
  account_id = var.cloudflare_account_id
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.tunnel.id

  config = {
    ingress = [
      {
        service = "http_status:404"
      }
    ]
    warp_routing = {
      enabled = true
    }
  }
}