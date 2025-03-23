# EC2 Instance in US-EAST-1
resource "aws_instance" "instance_east_1" {
  provider               = aws.us_east_1
  ami                    = var.ami_ids.us_east_1
  instance_type          = var.instance_type
  subnet_id              = var.subnet_east_1_id
  vpc_security_group_ids = [var.security_group_east_1_id]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_names.us_east_1
  }
}

# EC2 Instance in EU-WEST-2
resource "aws_instance" "instance_west_2" {
  provider               = aws.eu_west_2
  ami                    = var.ami_ids.eu_west_2
  instance_type          = var.instance_type
  subnet_id              = var.subnet_west_2_id
  vpc_security_group_ids = [var.security_group_west_2_id]
  associate_public_ip_address = true

  tags = {
    Name = var.instance_names.eu_west_2
  }
}