variable "unique_id" {
  description = "a unique identifier for resources"
  type        = string
}

variable "cloudflare_account_id" {
  description = "Cloudflare account id"
  type        = string
}

variable "oauth_client" {
  description = "OAuth client details"
  type = object({
    client_id              = string
    client_secret          = string
    authorization_endpoint = string
    token_endpoint         = string
    jwks_endpoint          = string
  })
}

# variable "device_posture" {
#   description = "enable or disable device posture checks"
#   type = bool
#   default = false
# }
