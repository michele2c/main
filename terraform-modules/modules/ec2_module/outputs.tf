# --- modules/ec2-instance/outputs.tf ---

output "my_instance_id" {
  value = aws_instance.app_server.id
}

output "my_public_ip" {
  value = aws_instance.app_server.public_ip
}