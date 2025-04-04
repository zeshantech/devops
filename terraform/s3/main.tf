terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "random_id" "random_id" {
  byte_length = 8
}

resource "aws_s3_bucket" "demo-bucket" {
  bucket = "demo-bucket-${random_id.random_id.hex}"
}

resource "aws_s3_object" "bucket-video" {
  bucket = aws_s3_bucket.demo-bucket.bucket
  source = "./video.mp4"
  key    = "mydata.mov"
}

output "video-url" {
  value = "https://${aws_s3_bucket.demo-bucket.bucket}.s3.${var.region}.amazonaws.com/${aws_s3_object.bucket-video.key}"
}
