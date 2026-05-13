terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.30.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.17.0"
    }
  }
  required_version = "1.14.6"
}

provider "aws" {
  alias  = "region_1"
  region = "us-east-1"
}
