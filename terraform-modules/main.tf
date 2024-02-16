# --- root/main.tf ---

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2_module"
  # required argument
  instance_type = "t2.micro"
}