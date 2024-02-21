# --- Create a Security Group Resource with Terraform
resource "aws_security_group" "main" {
  name   = "core-sg"
  vpc_id = "<VPC-ID-GOES-hERE>"

  ingress {
    description = "Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Port 80"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# --- Convert Security Group to use dynamic block
# Supply the content for these repeatable blocks via local values
locals {
  ingress_rules = [{
    port        = 443
    description = "Port 443"
    },
    {
      port        = 80
      description = "Port 80"
    }
  ]
}

resource "aws_security_group" "main" {
  name   = "core-sg"
  vpc_id = "<VPC-ID-GOES-hERE>"
  # --- Dynamic Block ---
  dynamic "ingress" {
    for_each = local.ingress_rules # map ingress rules

    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

/* Refactor our dynamic block to utilize a variable 
named web_ingress which is of map */

resource "aws_security_group" "main" {
  name = "core-sg"

  vpc_id = "<VPC-ID-GOES-hERE>"

  # Dynamic block
  dynamic "ingress" {
    for_each = var.web_ingress # variables file
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}