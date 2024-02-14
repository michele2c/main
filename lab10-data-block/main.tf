terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


# Terraform Data Block - To Lookup Latest Ubuntu 22.04 AMI Image
data "aws_ami" "ubuntu_22_04" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

# EC2 instance
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu_22_04.id # Data Block value
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-instance"
  }
}


data "aws_ami" "ubuntu" {
  owners = ["099720109477"]

  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}