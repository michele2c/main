# even marked as sensitive, this data will still be available in the state file
# It's important to encrypt and control access the state file

variable "first_name" {
  type      = string
  sensitive = true # marked as sensitive
  default   = "Terraform"
}

variable "last_name" {
  type      = string
  sensitive = true # marked as sensitive
  default   = "Tom"
}

variable "phone_number" {
  type      = string
  sensitive = true # marked as sensitive
  default   = "867-5309"
}

locals {
  contact_info = {
    first_name   = var.first_name
    last_name    = var.last_name
    phone_number = var.phone_number
  }

  my_number = nonsensitive(var.phone_number)
}

output "first_name" {
  value     = local.contact_info.first_name
  sensitive = true # matching the marked as sensitive
}

output "last_name" {
  value     = local.contact_info.last_name
  sensitive = true # matching the marked as sensitive
}

output "phone_number" {
  value     = local.contact_info.phone_number
  sensitive = true # matching the marked as sensitive
}

output "my_number" {
  value = local.my_number
}