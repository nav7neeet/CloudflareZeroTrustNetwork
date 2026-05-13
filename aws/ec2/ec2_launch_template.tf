resource "aws_launch_template" "launch_template" {
  name          = "${var.unique_id}_launch_template"
  instance_type = var.instance_type
  image_id      = var.ami_id[data.aws_region.current.region]

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "required"
  }

  ebs_optimized = true

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "${var.unique_id}_ec2"
    }
  }
}
