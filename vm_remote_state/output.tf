output "vm_ip" {
  value       = aws_instance.vm.public_ip
  description = "IP Público de la instancia VM"
}
