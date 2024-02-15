/*
Enter terraform import. With minimal coding and effort, we can add our resources to our 
configuration and bring them into state.
*/

# Task 1: Manually create EC2 (not with Terraform)


terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}  
provider "aws" {
  region = "us-east-1"
}

/* You must also have a destination resource to store state against. 
Add an empty resource block now. We will add an EC2 instance called "aws_linux".*/
resource "aws_instance" "aws_linux" {}

# Import the Resource into Terraform
/*
terraform import <resource.name> <unique_identifier>

Run on terminal => terraform import aws_instance.aws_linux <instance-id>

aws_instance.aws_linux to specify the resource in our config file
*/

/*
Run terraform state show command to to look for in our state file and find info of this new instance
like ami id and instance_type
*/
# terraform state show aws_instance.aws_linux
