output "sg_web_id" {
  value = aws_security_group.sg_web.id
}

output "sg_app_id" {
  value = aws_security_group.sg_app.id
}

output "sg_db_id" {
  value = aws_security_group.sg_db.id
}

output "sg_bastion_id" {
  value = aws_security_group.sg_bastion.id
}

output "sg_bastion" {
  description = "Security Group ID du Bastion"
  value       = aws_security_group.sg_bastion.id
}

output "sg_app" {
  description = "Security Group ID des serveurs applicatifs"
  value       = aws_security_group.sg_app.id
}
