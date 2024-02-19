# Variable must be unique
# Can not declare two variables with the same name

variable "instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "Terraform-Instance-Ubuntu"
}

variable "instance_type" {
  description = "Value of the Instance Type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "value"
  type        = string
  default     = "ami-0c7217cdde317cfec"
}