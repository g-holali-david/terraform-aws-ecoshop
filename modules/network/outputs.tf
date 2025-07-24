output "vpc_id" {
  value = aws_vpc.ecosop.id
}

output "web_subnets" {
  value = aws_subnet.web_public[*].id
}

output "app_subnets" {
  value = aws_subnet.app_private[*].id
}

output "db_subnets" {
  value = aws_subnet.db_private[*].id
}

output "azs" {
  value = var.azs
}

output "public_subnets" {
  description = "Liste des subnets publics pour le Bastion et ALB"
  value       = aws_subnet.web_public[*].id
}

output "private_app_subnets" {
  description = "Liste des subnets privés pour les serveurs applicatifs"
  value       = aws_subnet.app_private[*].id
}
