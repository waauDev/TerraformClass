output "vpc_east_1_id" {
  description = "ID of the US-EAST-1 VPC"
  value       = aws_vpc.vpc_east_1.id
}

output "vpc_west_2_id" {
  description = "ID of the EU-WEST-2 VPC"
  value       = aws_vpc.vpc_west_2.id
}

output "subnet_east_1_id" {
  description = "ID of the US-EAST-1 subnet"
  value       = aws_subnet.subnet_east_1.id
}

output "subnet_west_2_id" {
  description = "ID of the EU-WEST-2 subnet"
  value       = aws_subnet.subnet_west_2.id
}