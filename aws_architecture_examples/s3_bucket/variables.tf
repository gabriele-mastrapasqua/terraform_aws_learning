variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "S3 Bucket name"
  type        = string
  default     = "my-terraform-learning-test-bucket-name" # should be an unique name
}
