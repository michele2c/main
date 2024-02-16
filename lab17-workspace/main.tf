# workspace Default
provider "aws" {
  region = "us-east-1"
}

# workspace Development
# provider "aws" {
#   region = "us-west-2"
#   default_tags {
#     tags = {
#       Environment = terraform.workspace # tag the workspace
#     }
#   }
# }


# Example to crete a new workspace
# command = terraform workspace new development
# command = terraform workspace select default (switch)



# EC2 instance
resource "aws_instance" "app_server" {
  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  tags = {
    Name = "my-test-instance" 
  }
}