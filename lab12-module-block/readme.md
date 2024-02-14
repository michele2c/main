A module is used to combine resources that are frequently used together into a reusable container.
Modules are called by a <parent> or <root> module, and any modules called by the <parent> module are known as <child> modules.

Saved in a folder named <modules>, and each module is named for its respective function inside that folder and must be unique.
 You can also specify the <version> of the module

 /*--- Template ---*/
 module “<MODULE_NAME>” {
  # Block body
  source = <MODULE_SOURCE>
  <INPUT_NAME> = <DESCRIPTION> #Inputs
  <INPUT_NAME> = <DESCRIPTION> #Inputs
}
/* --- Example --- */
module "website_s3_bucket" {
  source = "./modules/aws-s3-static-website-bucket"

  bucket_name = var.s3_bucket_name
  aws_region = "us-east-1"

  tags = {
    Terraform   = "true"
    Environment = "certification"
  }
}