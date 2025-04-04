# output "website-url" {
#   value = aws_s3_bucket_website_configuration.webBucket.website_endpoint
# }

output "website_endpoint" {
  value = "http://${aws_s3_bucket.webBucket.website_endpoint}"
}
