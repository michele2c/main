# Configure Multiple AWS Providers
provider "aws" {
  alias   = "east"
  region  = "us-east-1"
}

provider "aws" {
  alias   = "west"
  region  = "us-west-2"
}

# Build Resources using provider alias
data "aws_ami" "ubuntu" {
  provider = aws.east # Alias
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "example" {
  provider = aws.east # Alias
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  tags = {
    Name = "East Server"
  }
}

resource "aws_vpc" "west-vpc" {
  provider = aws.west # Alias
  cidr_block = "10.10.0.0/16"

  tags = {
    Name        = "west-vpc"
    Environment = "disaster_recovery_environment"
    Terraform   = "true"
  }
}

resource "aws_vpc" "east-vpc" {
  provider = aws.east # Alias
  cidr_block = "10.25.0.0/24"

  tags = {
    Name        = "east-vpc"
    Environment = "production_environment"
    Terraform   = "true"
  }
}