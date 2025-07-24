output "bastion_id" {
  description = "ID de l'instance Bastion"
  value       = aws_instance.bastion.id
}

output "app_instance_ids" {
  description = "Liste des IDs des instances applicatives"
  value       = aws_instance.app_servers[*].id
}


output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}