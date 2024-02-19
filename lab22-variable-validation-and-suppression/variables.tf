variable "cloud" {
  type = string

  validation {
    condition     = contains(["aws", "azure", "gcp", "vmware"], lower(var.cloud))
    error_message = "You must use an approved cloud."
  }

  validation {
    condition     = lower(var.cloud) == var.cloud
    error_message = "The cloud name must not have capital letters."
  }
}


/*
Perform a terraform init and terraform plan. 
Provide inputs that both meet and do not meet the validation conditions to see the behavior.

terraform plan -var cloud=aws
terraform plan -var cloud=alibabba 
*/