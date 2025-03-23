variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_ids" {
  description = "AMI IDs for each region"
  type        = map(string)
}

variable "instance_names" {
  description = "Names for EC2 instances"
  type        = map(string)
}

variable "subnet_east_1_id" {
  description = "ID of the US-EAST-1 subnet"
  type        = string
}

variable "subnet_west_2_id" {
  description = "ID of the EU-WEST-2 subnet"
  type        = string
}

variable "security_group_east_1_id" {
  description = "ID of the US-EAST-1 security group"
  type        = string
}

variable "security_group_west_2_id" {
  description = "ID of the EU-WEST-2 security group"
  type        = string
}