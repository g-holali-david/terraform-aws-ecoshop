# Outputs of compute module

output "bastion_id" {
  description = "Instance ID of the Bastion Host"
  value       = aws_instance.bastion.id
}

output "bastion_public_ip" {
  description = "Public IP of the Bastion Host"
  value       = aws_instance.bastion.public_ip
}

output "app_server_ids" {
  description = "List of App Server instance IDs"
  value       = aws_instance.app_servers[*].id
}

output "app_private_ips" {
  description = "Private IPs of App Servers"
  value       = aws_instance.app_servers[*].private_ip
}
