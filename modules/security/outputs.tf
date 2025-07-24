# Outputs for security groups

output "sg_web_id" {
  description = "ID of the Web security group"
  value       = aws_security_group.sg_web.id
}

output "sg_app_id" {
  description = "ID of the Application security group"
  value       = aws_security_group.sg_app.id
}

output "sg_db_id" {
  description = "ID of the Database security group"
  value       = aws_security_group.sg_db.id
}

output "sg_bastion_id" {
  description = "ID of the Bastion Host security group"
  value       = aws_security_group.sg_bastion.id
}
