# --- root/outputs.tf ---

# value = module name declared in the main.tf "ec2"
# and the output name declared in the ec2_instance/outputs
# "my_instance_id" and "my_public_ip"

output "instance_public_ip" {
  description = "Public IP address"
  value       = module.ec2.my_public_ip
}

output "instance_id" {
  description = "EC2 ID"
  value       = module.ec2.my_instance_id

}