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
  name        = "jenkins-instance"
  team        = "api_mgmt_dev"
  application = "corp_api"
}

locals {
  # Common tags to be assigned to all resources
  # Easy to find and update
  common_tags = {
    Name  = local.name
    Owner = local.team
    App   = local.application
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c7217cdde317cfec" # static value
  instance_type = var.instance_type       # variable block

  tags = local.common_tags  
}