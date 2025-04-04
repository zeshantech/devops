variable "region" {
  default     = "us-east-1"
  description = "This is my default region"
}

variable "vpcCidrBlock" {
  default     = "172.6.0.0/16"
  description = "This is my default VPC CIDR block"
}

variable "vpcName" {
  default     = "tr-project"
  description = "This is my default VPC name"
}

variable "subnet1CidrBlock" {
  default     = "172.6.0.0/24"
  description = "This is my default subnet1 CIDR block"
}

variable "subnet1Name" {
  default     = "tr-project-subnet1"
  description = "This is my default subnet1 name"
}

variable "subnet2CidrBlock" {
  default     = "172.6.1.0/24"
  description = "This is my default subnet2 CIDR block"
}

variable "subnet2Name" {
  default     = "tr-project-subnet2 - private"
  description = "This is my default subnet2 name"
}

variable "subnet3CidrBlock" {
  default     = "172.6.2.0/24"
  description = "This is my default subnet3 CIDR block"
}

variable "subnet3Name" {
  default     = "tr-project-subnet3 - private"
  description = "This is my default subnet3 name"
}

variable "igwName" {
  default     = "tr-project-igw"
  description = "This is my default internet gateway name"
}

variable "ami" {
  default     = "ami-0e2c8caa4b6378d8c"
  description = "This is my default AMI"
}

variable "instanceType" {
  default     = "t2.micro"
  description = "This is my default instance type"
}

variable "publicInstanceName" {
  default     = "tr-project-public-instance"
  description = "This is my default public instance name"
}

variable "privateInstanceName" {
  default     = "tr-project-private-instance"
  description = "This is my default private instance name"
}
