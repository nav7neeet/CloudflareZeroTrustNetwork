variable "unique_id" {
  description = "a unique identifier for resources"
  type        = string
}

data "aws_region" "current" {}

data "aws_caller_identity" "current" {}

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