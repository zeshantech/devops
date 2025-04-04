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

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpcCidrBlock

  tags = {
    Name = var.vpcName
  }
}

# Create 3 subnets
resource "aws_subnet" "trProjectSubnet1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet1CidrBlock

  tags = {
    Name = var.subnet1Name
  }
}

resource "aws_subnet" "subnet2Private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet2CidrBlock

  tags = {
    Name = var.subnet2Name
  }
}

resource "aws_subnet" "subnet3Private" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet3CidrBlock

  tags = {
    Name = var.subnet3Name
  }
}

# Create an internet gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igwName
  }
}

# create route table
resource "aws_route_table" "internetAccess" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
}

# associate route table with subnets
resource "aws_route_table_association" "trProjectSubnet1" {
  subnet_id      = aws_subnet.trProjectSubnet1.id
  route_table_id = aws_route_table.internetAccess.id
}

# create security group
resource "aws_security_group" "publicSecurityGroup" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.publicSecurityGroupName
  }
}


# create 2 instances (private and public)
resource "aws_instance" "publicInstance" {
  ami           = var.ami
  instance_type = var.instanceType
  subnet_id     = aws_subnet.trProjectSubnet1.id

  tags = {
    Name = var.publicInstanceName
  }
}

resource "aws_instance" "privateInstance" {
  ami           = var.ami
  instance_type = var.instanceType
  subnet_id     = aws_subnet.subnet2Private.id

  tags = {
    Name = var.privateInstanceName
  }
}
