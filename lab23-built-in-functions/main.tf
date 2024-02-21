locals {
  maximum = max(var.num_1, var.num_2, var.num_3)
  minimum = min(var.num_1, var.num_2, var.num_3, 44, 20)
}

output "max_value" {
  value = local.maximum
}

output "min_value" {
  value = local.minimum
}

/* Example of a cirdsubnet funcion
https://github.com/btkrausen/hashicorp/blob/master/terraform/Hands-On%20Labs/Section%2009%20-%20Read%20Generate%20and%20Modify%20Configuration/08%20-%20Terraform_Built-in_Functions.md
#Deploy the private subnets
resource "aws_subnet" "private_subnets" {
  for_each          = var.private_subnets
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, each.value) <----
  availability_zone = tolist(data.aws_availability_zones.available.names)[each.value]

  tags = {
    Name      = each.key
    Terraform = "true"
  }
}
*/