# --- modules/ec2-instance/variables.tf ---

variable "ami" {
  type    = string
  default = "ami-0c7217cdde317cfec"
}

# deaclare vaeriable without value and make it required
variable "instance_type" {
  # type    = string
  # default = "t2.micro"
}

