terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.30.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "~> 4.2.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.7.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "~> 3.5.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.4"
    }
  }

  required_version = "1.14.6"
}