resource "aws_vpc" "vpc" {
  cidr_block                       = var.vpc["cidr"]
  enable_dns_support               = true
  enable_dns_hostnames             = true
  assign_generated_ipv6_cidr_block = var.vpc.ipv6_cidr ? true : false

  tags = {
    Name = "${var.unique_id}_vpc"
  }
}

resource "aws_subnet" "subnets" {
  for_each = var.vpc["subnets"]

  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr
  availability_zone       = "${data.aws_region.current.region}${each.value.az}"
  map_public_ip_on_launch = each.value.type == "public"

  ## for ipv6
  ipv6_cidr_block                 = var.vpc.ipv6_cidr ? cidrsubnet(aws_vpc.vpc.ipv6_cidr_block, 8, index(tolist(keys(var.vpc["subnets"])), each.key)) : null
  assign_ipv6_address_on_creation = var.vpc.ipv6_cidr ? true : false

  tags = {
    Name = "${var.unique_id}_${each.key}"
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.unique_id}_inet_gateway"
  }
}

resource "aws_default_route_table" "default_route_table" {
  default_route_table_id = aws_vpc.vpc.default_route_table_id
  route                  = []
}

resource "aws_route_table" "pub_route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "${var.unique_id}_pub_route_table"
  }
}

resource "aws_route_table" "priv_route_table" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "${var.unique_id}_priv_route_table"
  }
}

resource "aws_route_table_association" "route_table_association" {
  for_each = aws_subnet.subnets

  subnet_id      = each.value.id
  route_table_id = each.value.map_public_ip_on_launch ? aws_route_table.pub_route_table.id : aws_route_table.priv_route_table.id
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.vpc.id
}
