variable "regions" {
  description = "AWS regions for deployment"
  type        = map(string)
  default = {
    us_east_1 = "us-east-1"
    eu_west_2 = "eu-west-2"
  }
}

variable "vpc_cidr_blocks" {
  description = "CIDR blocks for VPCs"
  type        = map(string)
  default = {
    us_east_1 = "10.0.0.0/16"
    eu_west_2 = "10.1.0.0/16"
  }
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = map(string)
  default = {
    us_east_1 = "10.0.1.0/24"
    eu_west_2 = "10.1.1.0/24"
  }
}

variable "availability_zones" {
  description = "Availability zones for each region"
  type        = map(string)
  default = {
    us_east_1 = "us-east-1a"
    eu_west_2 = "eu-west-2a"
  }
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami_ids" {
  description = "AMI IDs for each region"
  type        = map(string)
  default = {
    us_east_1 = "ami-01184db239e4c756c"
    eu_west_2 = "ami-009d83c002e2789f1"
  }
}

variable "instance_names" {
  description = "Names for EC2 instances"
  type        = map(string)
  default = {
    us_east_1 = "William-instancia-Virginia-1"
    eu_west_2 = "William-instancia-London-2"
  }
}

variable "allowed_ports" {
  description = "Allowed TCP ports"
  type        = list(number)
  default     = [22, 3389]
}