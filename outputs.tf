output "us_east_1_instance_id" {
  description = "ID de la instancia en us-east-1"
  value       = module.compute.instance_east_1_id
}

output "us_east_1_instance_public_ip" {
  description = "IP pública de la instancia en us-east-1"
  value       = module.compute.instance_east_1_public_ip
}

output "eu_west_2_instance_id" {
  description = "ID de la instancia en eu-west-2"
  value       = module.compute.instance_west_2_id
}

output "eu_west_2_instance_public_ip" {
  description = "IP pública de la instancia en eu-west-2"
  value       = module.compute.instance_west_2_public_ip
}