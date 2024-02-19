terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Resource block - EC2 instance
resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type # variable block

  tags = {
    # reference a variable -> var.variable-name
    Name = var.instance_name # variable block
  }
}
