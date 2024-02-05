# Configuration 

# Terraform Block
terraform {
  required_version = ">= 1.0.0" # version greater/equal 1.0.0

  # Providers Block
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0" # version 3.0 or above / specific = 3.63.0
    }
    random = {
      source  = "hashicorp/random"
      version = "3.6.0" # version 3.6.0
    }
    http = {
      source = "hashicorp/http"
      version = "3.4.1"
    }
    local = {
      source = "hashicorp/local"
      version = "2.4.1"
    }
# TLS => Provides utilities for working with Transport Layer Security keys and certificates. 
#It provides resources that allow private keys, certificates and certficate requests to be created 
#as part of a Terraform deployment.
    tls = {
      source = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}


/*
Run a ``terraform init -upgrade`` to validate you pull down the provider versions specified
in the configuration and validate with a ``terraform version`` or a ``terraform providers`` command.
/*

/* multi-line 
comment
*/
# single-line comment
// single-line comment