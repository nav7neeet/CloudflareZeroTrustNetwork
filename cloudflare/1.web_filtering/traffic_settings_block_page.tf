resource "cloudflare_zero_trust_gateway_settings" "block_page_settings" {
  account_id = var.cloudflare_account_id
  settings = {
    block_page = {
      enabled     = true
      name        = "Corporate Secure Gateway"
      header_text = "Access Restricted by Security Policy"
      footer_text = "If you believe this is an error, please contact the IT Security Team."

      # Styling
      background_color = "#1A1A1B"
      logo_path        = "https://upload.wikimedia.org/wikipedia/commons/1/17/Condecoracao_42_mestre_de_infantaria.png"

      # Interactivity
      mailto_address = "helpdesk@example.com"
      mailto_subject = "Request for Website Unblock"

      # Context adds the "Reason", "User ID", and "Timestamp" 
      include_context = true
      suppress_footer = false
    }
  }
}
