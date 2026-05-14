variable "unique_id" {
  description = "a unique identifier for resources"
  type        = string
}

data "aws_region" "current" {}

data "http" "my_ip" {
  url = "https://checkip.amazonaws.com"
}

variable "vpc" {
  description = "aws vpc details"
  type = object({
    id   = string
    cidr = string

    subnet = object({
      pub_sub1a  = map(string)
      priv_sub1a = map(string)

      pub_sub1b  = map(string)
      priv_sub1b = map(string)
    })
  })
}

variable "subnets" {
  description = "list of subnets for creating ec2 instances"
  type        = set(string)
}

variable "cloudflare_tunnel_token" {
  description = "cloudflare tunnel token"
  type        = string
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "ec2 ami id"
  type        = map(string)
  default = {
    "us-east-1" = "ami-05ffe3c48a9991133" #64-bit (x86)
    "us-west-1" = "ami-061ad72bc140532fd" #64-bit (x86)
  }
}

variable "ports" {
  type        = set(string)
  description = "ports"
  default     = ["80", "443"]
}