#--- Create a random password --- #

resource "random_password" "password" {
  # force replacement, any time timestamp() changes, generate a new password
  keepers = {
    datetime = timestamp()
  }
  length  = 16
  special = true
}

output "password" {
  value     = random_password.password
  sensitive = true
}

resource "random_uuid" "guid" {
}

output "guid" {
  value = random_uuid.guid
}

# --- Generate public/private SSH keys dynamically --- #
resource "tls_private_key" "tls" {
  algorithm = "RSA"
}

# Save the public key to a local file "id_rsa.pub"
resource "local_file" "tls-public" {
  filename = "id_rsa.pub"
  content  = tls_private_key.tls.public_key_openssh
}
# Save the private key locally
resource "local_file" "tls-private" {
  filename = "id_rsa.pem"
  content  = tls_private_key.tls.private_key_pem

# Local-exec will run a chmod on the file after it is created
  provisioner "local-exec" {
    command = "chmod 600 id_rsa.pem"
  }
}