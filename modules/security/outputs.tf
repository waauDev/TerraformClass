output "security_group_east_1_id" {
  description = "ID of the US-EAST-1 security group"
  value       = aws_security_group.allow_ssh_rdp_icmp_east_1.id
}

output "security_group_west_2_id" {
  description = "ID of the EU-WEST-2 security group"
  value       = aws_security_group.allow_ssh_rdp_icmp_west_2.id
}