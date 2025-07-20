output "subnet_id" {
  description = "value of the subnet ID"
  value       = aws_subnet.subnet_counter.*.id
}
