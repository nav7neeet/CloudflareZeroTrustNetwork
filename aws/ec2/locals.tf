locals {
  userdata = templatefile("${path.module}/assets/user_data.sh", {
    ssm_cloudwatch_config   = aws_ssm_parameter.ssm_parameter.name,
    cloudflare_tunnel_token = var.cloudflare_tunnel_token,
    region                  = data.aws_region.current.region
  })
}

locals {
  ec2_policy_arn_map = {
    AmazonSSMManagedInstanceCore = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
    CloudWatchAgentServerPolicy  = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  }
}