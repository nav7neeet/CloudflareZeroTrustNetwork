variable "unique_id" {
  description = "a unique identifier for resources"
  type        = string
}

data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

variable "cloudflare_account_id" {
  description = "Cloudflare account id"
  type        = string
}

variable "dns_policy" {
  description = "Web filtering using gateway DNS policy"
  type        = bool
}

variable "http_policy" {
  description = "Web filtering using gateway http policy"
  type        = bool
}

variable "network_policy" {
  description = "Web filtering using gateway network policy"
  type        = bool
}

variable "dlp_policy" {
  description = "Web filtering using data loss prevention (dlp) policy"
  type        = bool
}

variable "device_posture_policy" {
  description = "Device posture policy"
  type        = bool
}
