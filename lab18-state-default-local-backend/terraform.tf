/* By default Terraform uses a local backend, where state information is 
stored and acted upon locally within the working directory in a local 
file named terraform.tfstate 
By default there is no backend configuration block within our configuration.
*/

terraform {
# Update Terraform local backend configuration
  backend "local" {
    path = "terraform.tfstate"
  }
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.36.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "3.6.0"
    }
  }
}