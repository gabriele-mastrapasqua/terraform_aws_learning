terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}


resource "aws_s3_bucket" "test_bucket" {
  bucket        = var.bucket_name
  force_destroy = false
}

resource "aws_s3_object" "test_objects" {
  for_each = fileset("files/", "*")
  source   = "files/${each.value}"
  etag     = filemd5("files/${each.value}")

  # bucket name and for each files, object name (key) as the filename
  bucket   = aws_s3_bucket.test_bucket.bucket
  key      = "${each.value}"


}