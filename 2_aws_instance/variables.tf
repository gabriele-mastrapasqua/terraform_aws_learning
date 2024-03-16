variable "aws_region" {
  description = "AWS Region to use."
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type to use."
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name."
  type        = string
  default     = "MyInstanceTest"
}
