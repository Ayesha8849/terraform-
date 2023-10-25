#Plugin to AWs
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#for authorization and authentication
#go on iam create user then go in user
#then in security creadetials took access and security key and paste it.

provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2JYMBWESBZUFJDG6"
  secret_key = "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"
}

#create ec2 instance
take ami id of ubuntu(or any machine) in t2 micro and paste it
resource "aws_instance" "s1" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  tags = {
    Name = "unix"
  }
}

#create vpc
resource "aws_vpc" "name-of-vpc" {
  cidr_block = "10.0.0.0/16"
tags = {
    Name = "name-of-vpc"
  }
}

#create subnet
resource "aws_subnet" "name-of-subnet" {
  vpc_id     = aws_vpc.name-of-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "prod-subnet"
  }
}

terraform apply

#create internat gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.name-of-vpc.id

  tags = {
    Name = "main"
  }
}

#create route table
resource "aws_route_table" "my-vpc" {
  vpc_id = aws_vpc.my-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "my-pub-route"
  }
}
