# --- Lab: Locals Block --- #

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


locals {
  team = "api_mgmt_dev"
  application = "corp_api"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # static value
  instance_type = var.instance_type # variable block
  subnet_id     = aws_subnet.public_subnets["public_subnet_1"].id
  tags = {
    Name = var.instance_name # var block
    Owner = local.team # locals var
    App = local.application # locals var
  }
}