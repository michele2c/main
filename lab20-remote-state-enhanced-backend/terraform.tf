# Terraform Remote State - Enhanced Backend
# https://github.com/btkrausen/hashicorp/blob/master/terraform/Hands-On%20Labs/Section%2008%20-%20Implement%20and%20Maintain%20State/05%20-%20Terraform_Remote_State_Enhanced_Backend.md#terraform-remote-state---enhanced-backend

terraform {
  backend "remote" {
    hostname     = "app.terraform.io" # terraform cloud
    organization = "michelecosta" # organization name

    workspaces {
      name = "my-aws-app" # workspace name
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}