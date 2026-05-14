

output "vpc" {
  description = "vpc details"
  value = {
    app_id = var.unique_id
    id     = aws_vpc.vpc.id
    cidr   = aws_vpc.vpc.cidr_block
    subnet = local.subnet_ids
  }
}
