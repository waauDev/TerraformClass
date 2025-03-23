# VPC US-EAST-1
resource "aws_vpc" "vpc_east_1" {
  provider   = aws.us_east_1
  cidr_block = var.vpc_cidr_blocks.us_east_1
  tags = {
    Name = "VPC-East-1"
  }
}

# VPC EU-WEST-2
resource "aws_vpc" "vpc_west_2" {
  provider   = aws.eu_west_2
  cidr_block = var.vpc_cidr_blocks.eu_west_2
  tags = {
    Name = "VPC-West-2"
  }
}

# Subnet US-EAST-1
resource "aws_subnet" "subnet_east_1" {
  provider          = aws.us_east_1
  vpc_id            = aws_vpc.vpc_east_1.id
  cidr_block        = var.subnet_cidr_blocks.us_east_1
  availability_zone = var.availability_zones.us_east_1
  tags = {
    Name = "Subnet-East-1"
  }
}

# Subnet EU-WEST-2
resource "aws_subnet" "subnet_west_2" {
  provider          = aws.eu_west_2
  vpc_id            = aws_vpc.vpc_west_2.id
  cidr_block        = var.subnet_cidr_blocks.eu_west_2
  availability_zone = var.availability_zones.eu_west_2
  tags = {
    Name = "Subnet-West-2"
  }
}

# Internet Gateway for US-EAST-1
resource "aws_internet_gateway" "igw_east_1" {
  provider = aws.us_east_1
  vpc_id   = aws_vpc.vpc_east_1.id
  tags = {
    Name = "IGW-East-1"
  }
}

# Internet Gateway for EU-WEST-2
resource "aws_internet_gateway" "igw_west_2" {
  provider = aws.eu_west_2
  vpc_id   = aws_vpc.vpc_west_2.id
  tags = {
    Name = "IGW-West-2"
  }
}

# Route Table for US-EAST-1
resource "aws_route_table" "rt_east_1" {
  provider = aws.us_east_1
  vpc_id   = aws_vpc.vpc_east_1.id
  tags = {
    Name = "RT-East-1"
  }
}

# Route Table for EU-WEST-2
resource "aws_route_table" "rt_west_2" {
  provider = aws.eu_west_2
  vpc_id   = aws_vpc.vpc_west_2.id
  tags = {
    Name = "RT-West-2"
  }
}

# Default Route for US-EAST-1
resource "aws_route" "route_east_1_default" {
  provider               = aws.us_east_1
  route_table_id         = aws_route_table.rt_east_1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_east_1.id
}

# Default Route for EU-WEST-2
resource "aws_route" "route_west_2_default" {
  provider               = aws.eu_west_2
  route_table_id         = aws_route_table.rt_west_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw_west_2.id
}

# VPC Peering Route for US-EAST-1
resource "aws_route" "route_east_1_to_west_2" {
  provider               = aws.us_east_1
  route_table_id         = aws_route_table.rt_east_1.id
  destination_cidr_block = var.vpc_cidr_blocks.eu_west_2
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# VPC Peering Route for EU-WEST-2
resource "aws_route" "route_west_2_to_east_1" {
  provider               = aws.eu_west_2
  route_table_id         = aws_route_table.rt_west_2.id
  destination_cidr_block = var.vpc_cidr_blocks.us_east_1
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
}

# Route Table Association for US-EAST-1
resource "aws_route_table_association" "association_east_1" {
  provider       = aws.us_east_1
  subnet_id      = aws_subnet.subnet_east_1.id
  route_table_id = aws_route_table.rt_east_1.id
}

# Route Table Association for EU-WEST-2
resource "aws_route_table_association" "association_west_2" {
  provider       = aws.eu_west_2
  subnet_id      = aws_subnet.subnet_west_2.id
  route_table_id = aws_route_table.rt_west_2.id
}

# VPC Peering Connection
resource "aws_vpc_peering_connection" "peer" {
  provider     = aws.us_east_1
  vpc_id       = aws_vpc.vpc_east_1.id
  peer_vpc_id  = aws_vpc.vpc_west_2.id
  peer_region  = var.regions.eu_west_2
  tags = {
    Name = "VPC-Peering"
  }
}

# VPC Peering Connection Accepter
resource "aws_vpc_peering_connection_accepter" "peer_accept" {
  provider                  = aws.eu_west_2
  vpc_peering_connection_id = aws_vpc_peering_connection.peer.id
  auto_accept               = true
  tags = {
    Name = "VPC-Peering-Accepter"
  }
}