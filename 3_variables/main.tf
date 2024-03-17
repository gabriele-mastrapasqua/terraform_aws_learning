terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

# for simplicity, we use variables here instead of variables.tf file

# default value
variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

# we could omit type if explicit
variable "base_cidr_block" {
  description = "A /16 CIDR range definition, such as 10.1.0.0/16, that the VPC will use"
  default     = "10.1.0.0/16"
}

# without a default, when running plan or apply, the cli will ask the user for this value
# try to comment the default list
variable "availability_zones" {
  description = "A list of availability zones in which to create subnets"
  type        = list(string)
  default = [
    "us-east-1a",
    "us-east-1b",
    "us-east-1c",
    "us-east-1e"
  ]
}

variable "ec2_instance_name" {
  default = "my_ec2_name"
}

# example of a bool
variable "enable_vpn_gateway" {
  description = "Enable a VPN gateway in your VPC."
  type        = bool
  default     = false
}


# map example
variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default = {
    project     = "project-test",
    environment = "dev"
  }

  # example of validation of variable values to follow the AWS naming restrictions
  validation {
    condition     = length(var.resource_tags["project"]) <= 16 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["project"])) == 0
    error_message = "The project tag must be no more than 16 characters, and only contain letters, numbers, and hyphens."
  }

  validation {
    condition     = length(var.resource_tags["environment"]) <= 8 && length(regexall("[^a-zA-Z0-9-]", var.resource_tags["environment"])) == 0
    error_message = "The environment tag must be no more than 8 characters, and only contain letters, numbers, and hyphens."
  }

}


# resources

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  # Referencing the base_cidr_block variable allows the network address
  # to be changed without modifying the configuration.
  cidr_block = var.base_cidr_block

  # usage of a map variable to get all keys<>values
  # to use a single value, use the syntax var.my_map["my_key"]
  tags = var.resource_tags
}

resource "aws_subnet" "az" {
  # Create one subnet for each given availability zone.
  count = length(var.availability_zones)

  # For each subnet, use one of the specified availability zones.
  availability_zone = var.availability_zones[count.index]

  # By referencing the aws_vpc.main object, Terraform knows that the subnet
  # must be created only after the VPC is created.
  vpc_id = aws_vpc.main.id

  # Built-in functions and operators can be used for simple transformations of
  # values, such as computing a subnet address. Here we create a /20 prefix for
  # each subnet, using consecutive addresses for each availability zone,
  # such as 10.1.16.0/20 .
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 4, count.index + 1)

  tags = var.resource_tags
}


resource "aws_instance" "my_app_instance" {
  ami           = "ami-080e1f13689e07408" # definded by region: ubuntu 22.04 LTS in us-east-1
  instance_type = "t2.micro"

  # example of variable string interpolation
  tags = {
    Name = "${var.ec2_instance_name}-test"
  }
}