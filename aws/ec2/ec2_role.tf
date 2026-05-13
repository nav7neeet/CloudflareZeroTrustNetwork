data "aws_iam_policy_document" "ec2_role_doc" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name                 = "${var.unique_id}_ec2_role"
  assume_role_policy   = data.aws_iam_policy_document.ec2_role_doc.json
  max_session_duration = 3600 * 1
}

resource "aws_iam_role_policy_attachment" "ec2_role_policy_attachment" {
  for_each   = local.ec2_policy_arn_map
  role       = aws_iam_role.ec2_role.name
  policy_arn = each.value
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
  name = "${var.unique_id}_ec2_instance_profile"
  role = aws_iam_role.ec2_role.name
}
