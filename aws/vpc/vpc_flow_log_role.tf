#-----------------IAM Policy------------------
data "aws_iam_policy_document" "flow_log_policy_doc" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:CreateLogGroup",
    ]
    resources = [
      "arn:aws:logs:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:log-group:*",
    ]
  }
}

resource "aws_iam_policy" "flow_log_policy" {
  name   = "${var.unique_id}_flow_log_policy"
  policy = data.aws_iam_policy_document.flow_log_policy_doc.json
}


#-----------------IAM Role------------------
data "aws_iam_policy_document" "flow_log_role_doc" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "flow_log_role" {
  name                 = "${var.unique_id}_flow_log_role"
  assume_role_policy   = data.aws_iam_policy_document.flow_log_role_doc.json
  max_session_duration = 3600 * 1
}

resource "aws_iam_role_policy_attachment" "flow_log_role_policy_attachment" {
  role       = aws_iam_role.flow_log_role.name
  policy_arn = aws_iam_policy.flow_log_policy.arn
}
