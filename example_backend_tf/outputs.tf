output "subnet_id" {
  description = "value of the subnet ID"
  value       = aws_subnet.subnet.id
}

output "security_group_id" {
  description = "value of the security group ID"
  value       = aws_security_group.security_group.id

}
