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

# EC2 instance
resource "aws_instance" "app_server" {
  ami           = data.aws_ami.ubuntu_22_04.id # Data Block value
  instance_type = "t2.micro"

  tags = {
    Name = "my-ec2-instance"
  }
}

# Query existing resources using a data block

data "aws_s3_bucket" "data_bucket" {
  bucket = "my-bucket-name"
}

/* use information from that data lookup to create a new IAM policy 
to permit access to our new S3 bucket */

resource "aws_iam_policy" "policy" {
  name        = "data_bucket_policy" # name of the policy
  description = "Allow access to my bucket"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Resource": "${data.aws_s3_bucket.data_bucket.arn}" # arn attribute of the bucket
        }
    ]
  })
}
# --- Output information from Data lookup ---# 
output "data-bucket-arn" {
  value = data.aws_s3_bucket.data_bucket.arn
}

output "data-bucket-domain-name" {
  value = data.aws_s3_bucket.data_bucket.bucket_domain_name
}

output "data-bucket-region" {
  value = "The ${data.aws_s3_bucket.data_bucket.id} bucket is located in ${data.aws_s3_bucket.data_bucket.region}"
}