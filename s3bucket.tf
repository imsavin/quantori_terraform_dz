resource "aws_s3_bucket" "isavin-terraform-bucket" {
  bucket = "isavin-s3terraformbucket"
  acl    = "private"
  versioning {
    enabled = true
  }
  lifecycle_rule {

    id      = "log"
    enabled = true

    transition {
      days          = 30
      storage_class = "ONEZONE_IA"
    }


    expiration {
      days = 90
    }

  }
}