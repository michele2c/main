# Resource block - EC2 instance
resource "aws_instance" "pipeline" {
  ami             = "ami-0c7217cdde317cfec" # make sure it's free tier
  instance_type   = "t2.micro"
  key_name        = "tfproject"
  security_groups = [aws_security_group.jenkins_sg.id]
  # user_data = 
  tags = {
    Name = "jenkins-instance"
  }
}

# Resource block - Security Group 
resource "aws_security_group" "jenkins_sg" {
  name        = "jenkins_sg"
  description = "Traffic Jenkins Instance"
  vpc_id      = "<vpc id>" # Deafult VPC

  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["<my-ip>"] # My IP address
  }

  ingress {
    description = "Allow Port 8080"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Terraform removes the default rule
  egress {
    description = "Allow all ip and ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "jenkins_sg"
  }
}
