resource "aws_s3_bucket" "terraform_state" {
  bucket = var.bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}