variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
}

variable "webBucketName" {
  description = "The name of the S3 bucket to upload website"
  type        = string
  default     = "bucket-name-2272xdhd333h3"
}