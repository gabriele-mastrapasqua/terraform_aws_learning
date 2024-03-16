terraform {

  # terraform cloud settings
  cloud {
    organization = "mytestorganization123"
    workspaces {
      name = "workspace-learning"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "my_app_instance" {
  ami           = "ami-080e1f13689e07408" # definded by region: ubuntu 22.04 LTS in us-east-1
  instance_type = var.instance_type

  tags = {
    Name = var.instance_name
  }
}