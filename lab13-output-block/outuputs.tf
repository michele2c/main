/* output values allow you to export structured data about your resources 
*/
output "hello-world" {
  description = "Print a Hello World text output"
  value = "Hello World"
}

output "public_url" {
  description = "Public URL for our Web Server"
  value = "https://${aws_instance.web_server.private_ip}:8080/index.html"
}

output "vpc_information" {
  description = "VPC Information about Environment"
  value = "Your ${aws_vpc.vpc.tags.Environment} VPC has an ID of ${aws_vpc.vpc.id}"
}

# read the info in JSON
# terraform output -json

# terraform output