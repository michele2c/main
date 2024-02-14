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

# EC2 instance
resource "aws_instance" "app_server" {
  ami           = "ami-0c7217cdde317cfec" # static value
  instance_type = var.instance_type # variable block

  tags = {
  # reference a variable -> var.variable-name
    Name = var.instance_name # variable block
  }
}
