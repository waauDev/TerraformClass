variable "vpc_east_1_id" {
  description = "ID of the US-EAST-1 VPC"
  type        = string
}

variable "vpc_west_2_id" {
  description = "ID of the EU-WEST-2 VPC"
  type        = string
}

variable "allowed_ports" {
  description = "Allowed TCP ports"
  type        = list(number)
  default     = [22, 3389]
}