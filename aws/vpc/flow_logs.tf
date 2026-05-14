resource "aws_cloudwatch_log_group" "log_group" {
  name              = "${var.unique_id}/vpc/flow_logs"
  retention_in_days = 1
  skip_destroy      = false

  # kms_key_id = "arn:aws:kms:${data.aws_region.current.region}:${data.aws_caller_identity.current.account_id}:alias/aws/logs"
}

resource "aws_flow_log" "vpc_flow_log" {
  iam_role_arn    = aws_iam_role.flow_log_role.arn
  log_destination = aws_cloudwatch_log_group.log_group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.vpc.id

  ## https://docs.aws.amazon.com/vpc/latest/userguide/flow-log-records.html
  ## https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
  log_format = "$${flow-direction} $${protocol} $${subnet-id} $${srcaddr} $${pkt-srcaddr} $${srcport} $${dstaddr} $${pkt-dstaddr} $${dstport} $${action} $${traffic-path} $${log-status} $${reject-reason}"

  tags = {
    "Name" = "${var.unique_id}_flow_log"
  }
}