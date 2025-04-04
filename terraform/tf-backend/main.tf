terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "5.82.2"
        }
    }
    backend "s3" {
        bucket = "demo-bucket-2ded84affe85dd4f"
        key    = "terraform-backend.tfstate"  
        region = "us-east-1"
    }
}

provider "aws" {
    region = var.region
}

resource "aws_instance" "web" {
    ami           = var.ami
    instance_type = var.instance_type
}

