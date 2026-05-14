#!/bin/bash

set -e

# Ouput all log
exec > >(tee /var/log/user-data.log|logger -t user-data-extra -s 2>/dev/console) 2>&1

# Install the latest updates
yum update -y
yum upgrade -y

# Install Cloudwatch agent
yum install amazon-cloudwatch-agent -y

# Configure cloudwatch agent, use config from SSM
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl \
-a fetch-config \
-m ec2 \
-c ssm:${ssm_cloudwatch_config} -s


# install cloudflare
# Add cloudflared.repo to /etc/yum.repos.d/ 
curl -fsSL https://pkg.cloudflare.com/cloudflared.repo | sudo tee /etc/yum.repos.d/cloudflared.repo

# install cloudflared
sudo yum install cloudflared -y

sudo cloudflared service install ${cloudflare_tunnel_token}