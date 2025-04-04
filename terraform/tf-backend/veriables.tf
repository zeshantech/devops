variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0e2c8caa4b6378d8c"
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t2.micro"
}