
provider "aws" {
 }
variable "cidr-blocks" {
  type = list(string)
}
variable "vpc-cidr-block" {
  description = "vpc cidr block"
  default = "10.0.0.0/16"
}

variable "subnet-cidr-block" {
  description = "subnet cidr block"
  default = "10.0.6.0/24"
  type = string
}

variable "env" {
  description = "env to display"
  default = "development"
}
variable az {}

resource "aws_vpc" "ttt-vpc" {
  cidr_block = var.cidr-blocks[0]
  tags = {
    Name = var.env
  }
}

resource "aws_subnet" "ttt-subnet-1" {
  vpc_id = aws_vpc.ttt-vpc.id 
  cidr_block = var.cidr-blocks[1]
  availability_zone = var.az
  tags = {
    Name = "ttt-subnet-01"
    Subnet = "01"
  }
} 

output "ttt-vpc-id" {
value = aws_vpc.ttt-vpc.id
}

output "ttt-subnet-id" {
  value = aws_subnet.ttt-subnet-1.id
}



