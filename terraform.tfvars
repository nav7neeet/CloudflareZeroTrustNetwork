unique_id = "zero_trust"

# ── Cloudflare ──────────────────────────────────────────────────────────────
cloudflare_zero_trust_team_name = "REPLACE_zero_trust_team_name"
cloudflare_account_id           = "REPLACE_account_id"

# ── AWS VPC ─────────────────────────────────────────────────────────────────
vpc = {
  cidr      = "10.0.0.0/16"
  ipv6_cidr = true

  subnets = {
    pub_sub1a  = { cidr = "10.0.10.0/24", az = "a", type = "public" }
    priv_sub1a = { cidr = "10.0.20.0/24", az = "a", type = "private" }

    pub_sub1b  = { cidr = "10.0.40.0/24", az = "b", type = "public" }
    priv_sub1b = { cidr = "10.0.50.0/24", az = "b", type = "private" }
  }
}
