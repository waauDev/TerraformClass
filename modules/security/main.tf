# Security Group for US-EAST-1
resource "aws_security_group" "allow_ssh_rdp_icmp_east_1" {
  provider = aws.us_east_1
  vpc_id   = var.vpc_east_1_id
  name     = "allow_ssh_rdp_icmp_east_1"

  # SSH
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow-SSH-RDP-ICMP-East-1"
  }
}

# Security Group for EU-WEST-2
resource "aws_security_group" "allow_ssh_rdp_icmp_west_2" {
  provider = aws.eu_west_2
  vpc_id   = var.vpc_west_2_id
  name     = "allow_ssh_rdp_icmp_west_2"

  # SSH
  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  # ICMP
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Allow-SSH-RDP-ICMP-West-2"
  }
}