# --- root/main.tf ---

provider "aws" {
  region = "us-east-1"
}

module "ec2" {
  source = "./modules/ec2_module"
  # required argument
  instance_type = "t2.micro"
}


# --- Terraform Modules - Public Module Registry ---# 
module "s3-bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.0" # module version
}

output "s3_bucket_name" {
  value = module.s3-bucket.s3_bucket_bucket_domain_name
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.2" # module version

  name = "my-vpc"      # configurable
  cidr = "10.0.0.0/16" # configurable

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]          # configurable
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]       # configurable
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"] # configurable

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}