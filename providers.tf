terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.90.1"
    }
  }
}

provider "aws" {
  alias  = "us_east_1"
  region = var.regions.us_east_1
}

provider "aws" {
  alias  = "eu_west_2"
  region = var.regions.eu_west_2
}