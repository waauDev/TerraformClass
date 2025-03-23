output "instance_east_1_id" {
  description = "ID of the US-EAST-1 EC2 instance"
  value       = aws_instance.instance_east_1.id
}

output "instance_east_1_public_ip" {
  description = "Public IP of the US-EAST-1 EC2 instance"
  value       = aws_instance.instance_east_1.public_ip
}

output "instance_west_2_id" {
  description = "ID of the EU-WEST-2 EC2 instance"
  value       = aws_instance.instance_west_2.id
}

output "instance_west_2_public_ip" {
  description = "Public IP of the EU-WEST-2 EC2 instance"
  value       = aws_instance.instance_west_2.public_ip
}