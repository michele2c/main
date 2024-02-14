/* Generate SSH Key with Terraform TLS Provider */

# using tls provider
resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

# using the local provider
resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "MyAWSKey.pem"
}
