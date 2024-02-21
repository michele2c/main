# --- Use create_before_destroy ---

resource "aws_security_group" "main" {
  name = "core-sg-global" # there was a name change, for example

  vpc_id = "<vpc-id>"

  dynamic "ingress" {
    for_each = var.web_ingress
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
# lifecycle configuration block
  lifecycle {
    create_before_destroy = true # Specify that this resource should be created before the existing security group is destroyed.
    prevent_destroy = true # The prevent_destroy lifecycle directive can be used on resources that are stateful in nature (s3 buckets, RDS instances)
  }

}