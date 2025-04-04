terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}


resource "aws_s3_bucket" "webBucket" {
  bucket        = var.webBucketName
  force_destroy = true
}

resource "aws_s3_object" "websiteRoot" {
  bucket       = aws_s3_bucket.webBucket.id
  key          = "index.html"
  source       = "./index.html"
  content_type = "text/html"
  etag         = filemd5("./index.html")

}

resource "aws_s3_bucket_public_access_block" "webBucket" {
  bucket = aws_s3_bucket.webBucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "webBucket" {
  bucket = aws_s3_bucket.webBucket.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action = [
          "s3:GetObject"
        ],
        Resource = [
          "arn:aws:s3:::${aws_s3_bucket.webBucket.id}/*"
        ]
      }
    ]
  })

}

resource "aws_s3_bucket_website_configuration" "webBucket" {
  bucket = aws_s3_bucket.webBucket.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}


