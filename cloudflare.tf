module "cloudflare" {
  source = "./cloudflare/0.one_client_setup"
  providers = {
    cloudflare = cloudflare
  }
  unique_id             = var.unique_id
  cloudflare_account_id = var.cloudflare_account_id
  oauth_client          = module.cognito.oauth_client
}

# module "cloudflare_web_filtering" {
#   source = "./cloudflare/1.web_filtering"
#   providers = {
#     cloudflare = cloudflare
#   }
#   unique_id             = var.unique_id
#   cloudflare_account_id = var.cloudflare_account_id
#   dns_policy            = false
#   http_policy           = false
#   network_policy        = false
#   dlp_policy            = false
# }



# module "cloudflare_pvt_resource_access" {
#   source = "./cloudflare/2.pvt_resource_access"
#   providers = {
#     cloudflare = cloudflare
#   }
#   unique_id             = var.unique_id
#   cloudflare_account_id = var.cloudflare_account_id
# }



# module "cloudflare_device_posture_checks" {
#   source = "./cloudflare/3.device_posture"
#   providers = {
#     cloudflare = cloudflare
#   }
#   unique_id      = var.unique_id
#   cloudflare_account_id     = var.cloudflare_account_id
# }

# output "malicious_ips" {
#   value = module.cloudflare_web_filtering.malicious_ips
# }
