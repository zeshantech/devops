output "instance_public_ip" {
  value = aws_instance.ubuntu-server.public_ip
}
output "instance_public_dns" {
  value = aws_instance.ubuntu-server.public_dns
}

