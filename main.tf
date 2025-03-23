# Módulo de Red
module "network" {
  source = "./modules/network"

  regions            = var.regions
  vpc_cidr_blocks    = var.vpc_cidr_blocks
  subnet_cidr_blocks = var.subnet_cidr_blocks
  availability_zones = var.availability_zones

  providers = {
    aws.us_east_1 = aws.us_east_1
    aws.eu_west_2 = aws.eu_west_2
  }
}

# Módulo de Seguridad
module "security" {
  source = "./modules/security"

  vpc_east_1_id = module.network.vpc_east_1_id
  vpc_west_2_id = module.network.vpc_west_2_id
  allowed_ports = var.allowed_ports

  providers = {
    aws.us_east_1 = aws.us_east_1
    aws.eu_west_2 = aws.eu_west_2
  }
}

# Módulo de Computación
module "compute" {
  source = "./modules/compute"

  instance_type           = var.instance_type
  ami_ids                 = var.ami_ids
  instance_names          = var.instance_names
  subnet_east_1_id        = module.network.subnet_east_1_id
  subnet_west_2_id        = module.network.subnet_west_2_id
  security_group_east_1_id = module.security.security_group_east_1_id
  security_group_west_2_id = module.security.security_group_west_2_id

  providers = {
    aws.us_east_1 = aws.us_east_1
    aws.eu_west_2 = aws.eu_west_2
  }
}