locals {
  subnet_ids = {
    for key, value in aws_subnet.subnets :
    key => {
      id   = value.id
      cidr = value.cidr_block
    }
  }
}