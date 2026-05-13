terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "~> 3.8.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.17.0"
    }
  }
  required_version = "1.14.6"
}
