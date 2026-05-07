terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.44.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

# Data Source it allow you to fetch and use information from external source or existing source within your code

#_______________________vpc id fetch________________________________________
data "aws_vpc" "name" {
    tags = {
      Name = "default-VPC"
    }
  
}

output "vpc_id" {
    value = data.aws_vpc.name.id
  
}

#___________________security group_____________________________________
data "aws_security_group" "name" {
  tags = {
    Name = "Default"
  } 
}

output "security_group" {
  value = data.aws_security_group.name.id
}


#_____________________Subnet fetch_______________________________
data "aws_subnet" "name" {
  filter {
    name = "vpc-id"
    values = [ data.aws_vpc.name.id ]
  }
  tags = {
    Name = "custom-Subnet-1a"
  }
}

output "aws_subnet" {
  value = data.aws_subnet.name.id
  
}


#__________________Region Fetch______________________________
data "aws_region" "name" {
}

output "aws_region" {
  value = data.aws_region.name.id

}

#_________________Avaiblity zone_____________________________
data "aws_availability_zones" "name" {
  state = "available"
  
}

output "availability_zones" {
  value = data.aws_availability_zones.name.names
}

#_____________________EC2 using data source_____________________
resource "aws_instance" "march-1" {
  ami = "ami-05d2d839d4f73aafb"
  instance_type = "t3.micro"
  subnet_id = data.aws_subnet.name.id
  security_groups = [ data.aws_security_group.name.id ]
  
  tags = {
    Name = "march-1"
  }
  
}