output "rds_endpoint" {
  value = aws_db_instance.ecoshop_db.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.ecoshop_db.id
}


output "db_username" {
  value = var.db_username
}

output "db_password" {
  value     = var.db_password
  sensitive = true
}