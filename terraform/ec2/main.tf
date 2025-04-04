terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "ubuntu-server" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  tags = {
    Name                = "UbuntuServer"
    propagate_at_launch = true
  }
}
