data "aws_region" "current" {}

variable "unique_id" {
  description = "a unique identifier for resources"
  type        = string
}

variable "cloudflare_zero_trust_team_name" {
  description = "Cloudflare zero trust team name"
  type        = string
}

variable "users" {
  description = "Cognitor Users"
  type = map(object({
    firstname = string
    lastname  = string
    email     = string
    group = object({
      name        = string
      description = string
    })
  }))

  default = {
    user1 = {
      firstname = "PV"
      lastname  = "Sindhu"
      email     = "pv.sindhu@example.com"
      group = {
        name        = "Shuttler"
        description = "Shuttlers Group"
      }
    }
    user2 = {
      firstname = "Virat"
      lastname  = "Kohli"
      email     = "virat.kohli@exammple.com"
      group = {
        name        = "Cricketer"
        description = "Cricketer's group"
      }
    }
    user3 = {
      firstname = "Sunil"
      lastname  = "Chhetri"
      email     = "sunil.chhetri@exammple.com"
      group = {
        name        = "Footballer"
        description = "Footballer's group"
      }
    }
  }
}

variable "logout_urls" {
  description = "Logout URLs for oauth client"
  type        = set(string)
  default = [
    "http://localhost/logout",
  ]
}
