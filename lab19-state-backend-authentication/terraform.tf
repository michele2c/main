# S3 Standard Backend
# Our terraform configuration block for this lab is located in the terraform.tf file.
# The s3 backend stores Terraform state as a given key in a given bucket on Amazon S3
# Refer to https://github.com/btkrausen/hashicorp/blob/master/terraform/Hands-On%20Labs/Section%2008%20-%20Implement%20and%20Maintain%20State/03%20-%20Terraform_State_Backend_Authentication.md

terraform {
  # Update Terraform Configuration to use s3 backend
  backend "s3" {
    bucket = "my-terraform-state-mcosta" # bucket name
    key    = "prod/aws-infra" # path to the file - this creates a key named "prod"(folder) and "file"
    region = "us-east-1"

    # Encrypt with DynmoDB
    dynamodb_table = "value"
    encrypt = true
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
