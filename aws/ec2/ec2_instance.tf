resource "aws_ssm_parameter" "ssm_parameter" {
  description = "Cloudwatch agent config to configure custom log"
  name        = "${var.unique_id}_config"
  type        = "String"
  value       = file("${path.module}/assets/cloudwatch_agent_config.json")
}

resource "aws_instance" "instance" {
  for_each             = var.subnets
  subnet_id            = var.vpc.subnet[each.key].id
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name

  launch_template {
    name    = aws_launch_template.launch_template.name
    version = 1
  }

  vpc_security_group_ids = [aws_security_group.ec2_sec_group.id]

  user_data = local.userdata
  key_name  = aws_key_pair.public_key.key_name

  ebs_optimized = true
  root_block_device {
    encrypted = true
  }

  tags = {
    Name = "${var.unique_id}_ec2"
  }
}


