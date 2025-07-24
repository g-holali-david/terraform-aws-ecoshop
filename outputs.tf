output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "rds_endpoint" {
  value = module.rds.rds_endpoint
}


output "private_key_pem" {
  value     = tls_private_key.ecoshop.private_key_pem
  sensitive = true
}