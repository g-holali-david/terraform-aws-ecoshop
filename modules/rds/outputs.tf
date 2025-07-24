output "rds_endpoint" {
  value = aws_db_instance.ecoshop_db.endpoint
}

output "rds_identifier" {
  value = aws_db_instance.ecoshop_db.id
}