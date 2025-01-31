# outputs.tf
output "nginx_instance_1_public_ip" {
  value = aws_instance.nginx_instance_1.public_ip
}

output "nginx_instance_2_public_ip" {
  value = aws_instance.nginx_instance_2.public_ip
}
