terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }
  }
}

# Add a new resource to deploy an Amazon S3 bucket

resource "aws_s3_bucket" "my-new-S3-bucket" {
 # Update the Amazon S3 bucket to use the random ID
  bucket = "tf-bucket-${random_id.randomness.hex}"

  tags = {
    Name    = "My S3 Bucket"
    Purpose = "Intro to Resource Blocks Lab"
  }
}

resource "aws_s3_bucket_ownership_controls" "my_new_bucket_acl" {
  bucket = aws_s3_bucket.my-new-S3-bucket.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# Configure an AWS security group
resource "aws_security_group" "my-new-security-group" {
  name        = "web_server_inbound"
  description = "Allow inbound traffic on tcp/443"
  vpc_id      = "vpc-0fb73703b42911725"

  ingress {
    description = "Allow 443 from the Internet"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "web_server_inbound"
    Purpose = "Intro to Resource Blocks Lab"
  }
}

# Configure a resource from the random provider
resource "random_id" "randomness" {
  byte_length = 16
}