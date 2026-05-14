# ── Device Posture Check: Safari Running ──
resource "cloudflare_zero_trust_device_posture_rule" "rule" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_device_posture_safari"
  type        = "application"
  description = "Checks if Safari browser is running on the device"
  schedule    = "1m"

  input = {
    operating_system = "mac"
    path             = "/Applications/Safari.app/Contents/MacOS/Safari"
  }

  match = [{
    platform = "mac"
  }]
}

resource "cloudflare_zero_trust_gateway_policy" "policy" {
  account_id  = var.cloudflare_account_id
  name        = "${var.unique_id}_device_posture_checks"
  description = "Blocks network traffic if the Safari device posture check has not passed"
  enabled     = var.device_posture_policy
  action      = "block"
  filters     = ["l4"]
  precedence  = 100

  device_posture = "not(any(device_posture.checks.passed[*] in {\"${cloudflare_zero_trust_device_posture_rule.rule.id}\"}))"

  rule_settings = {
    block_page_enabled = true
  }
}
