# terraform-
#trying to automate cloud infra through terraform

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIA2JYMBWESJQQUO4EK"
  secret_key = "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"
}
resource "aws_instance" "s1" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"

  tags = {
    Name = "unix"
  }
}
