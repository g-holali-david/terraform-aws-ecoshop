output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the created VPC"
}

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "IDs of the public subnets"
}

output "private_app_subnet_ids" {
  value       = aws_subnet.private_app[*].id
  description = "IDs of the private subnets for app tier"
}

output "private_db_subnet_ids" {
  value       = aws_subnet.private_db[*].id
  description = "IDs of the private subnets for DB tier"
}
