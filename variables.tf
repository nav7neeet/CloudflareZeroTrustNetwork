variable "unique_id" {
  description = "a unique identifier for resources"
  type        = string
}

variable "cloudflare_zero_trust_team_name" {
  description = "cloudflare zero trust team name"
  type        = string
}

variable "cloudflare_account_id" {
  description = "cloudflare account id"
  type        = string
}

variable "vpc" {
  description = "aws vpc parameters"
  type = object({
    cidr      = string
    ipv6_cidr = bool

    subnets = object({
      pub_sub1a  = optional(map(string))
      priv_sub1a = optional(map(string))

      pub_sub1b  = optional(map(string))
      priv_sub1b = optional(map(string))
    })
  })
}
