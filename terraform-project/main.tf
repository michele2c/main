# Resource block - EC2 instance
resource "aws_instance" "pipeline" {
  ami           = "ami-0c7217cdde317cfec" # make sure it's free tier
  instance_type = "t2.micro"
  key_name      = "tfproject"
#   security_groups = [aws_security_group.jenkins_sg.id]

  tags = {
    Name = "jenkins-instance"
  }
}

# Resource block - Security Group 
# resource "aws_security_group" "jenkins_sg" {
#   name        = "jenkins_sg"
#   description = "Security Group for Jenkins Instance"
#   vpc_id      = "vpc id" # Deafult VPC

# ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["my-ip"]  # My IP address
#   }

#   ingress {
#     from_port   = 8080
#     to_port     = 8080
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

// Terraform removes the default rule
  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

#   tags = {
#     Name = "jenkins_sg"
#   }
# }
