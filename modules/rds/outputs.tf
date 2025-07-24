# Outputs for the RDS module

output "rds_endpoint" {
  description = "RDS endpoint to connect to the database"
  value       = aws_db_instance.this.endpoint
}

output "rds_identifier" {
  description = "Identifier of the RDS instance"
  value       = aws_db_instance.this.id
}
