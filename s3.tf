resource "aws_s3_bucket" "test_bucket" {
  bucket = var.bucket
}

# upload a text file to the bucket
resource "aws_s3_bucket_object" "object" {
  bucket = var.bucket
  key    = var.object_key_name
  source = "."
}