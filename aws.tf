module "cognito" {
  source = "./aws/cognito"
  providers = {
    aws = aws.region_1
  }
  unique_id                       = "zero-trust"
  cloudflare_zero_trust_team_name = var.cloudflare_zero_trust_team_name
}

# module "vpc" {
#   source = "./aws/vpc"
#   providers = {
#     aws = aws.region_1
#   }

#   unique_id = var.unique_id
#   vpc       = var.vpc
# }


# module "ec2" {
#   source = "./aws/ec2"
#   providers = {
#     aws = aws.region_1
#   }

#   unique_id = var.unique_id
#   subnets = [
#     "pub_sub1a",
#   ]
#   vpc                     = module.vpc.vpc
#   cloudflare_tunnel_token = module.cloudflare_pvt_resource_access.connector_token
# }
