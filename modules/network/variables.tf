variable "vpc_cidr_blocks" {
  description = "CIDR blocks for VPCs"
  type        = map(string)
}

variable "subnet_cidr_blocks" {
  description = "CIDR blocks for subnets"
  type        = map(string)
}

variable "availability_zones" {
  description = "Availability zones for each region"
  type        = map(string)
}

variable "regions" {
  description = "AWS regions for deployment"
  type        = map(string)
}