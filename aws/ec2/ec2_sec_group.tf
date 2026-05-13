resource "aws_security_group" "ec2_sec_group" {
  name        = "${var.unique_id}_ec2_sec_group"
  description = "Allow inbound web traffic and Cloudflare Tunnel egress"
  vpc_id      = var.vpc.id

  # --- INBOUND RULES ---
  ingress {
    description = "Allow SSH traffic only from my IP address"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${chomp(data.http.my_ip.response_body)}/32"]
  }

  ingress {
    description = "Allow incoming ICMP traffic"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow incoming ICMP v6 traffic"
    from_port        = -1
    to_port          = -1
    protocol         = "58"
    ipv6_cidr_blocks = ["::/0"]
  }

  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Allow inbound traffic for local services"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # --- OUTBOUND RULES ---

  # Cloudflare Tunnel Data Plane (QUIC and HTTP/2)
  egress {
    description = "Cloudflare Tunnel - UDP for QUIC (Primary)"
    from_port   = 7844
    to_port     = 7844
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Cloudflare Tunnel - TCP for HTTP/2 (Fallback)"
    from_port   = 7844
    to_port     = 7844
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "egress" {
    for_each = var.ports
    iterator = port
    content {
      description = "Allow outbound curl"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    description = "Allow outgoing ICMP traffic"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow outgoing ICMP v6 traffic"
    from_port        = -1
    to_port          = -1
    protocol         = "58"
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.unique_id}_ec2_sec_group"
  }
}