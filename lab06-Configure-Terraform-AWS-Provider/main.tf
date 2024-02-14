# --- Lab: Configure Terraform AWS Provider --- #

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"

  # Static credentials
  access_key = "my-access-key"
  secret_key = "my-secret-key"

  # Shared credentials/configuration file
  shared_credentials_file = "$HOME/.aws/credentials"
  profile                 = "custom-profile"

}