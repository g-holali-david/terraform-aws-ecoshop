# ------------------------------------------------------------
# Global Outputs for EcoShop Infrastructure
# ------------------------------------------------------------

output "vpc_id" {
  value       = module.network.vpc_id
  description = "ID of the created VPC"
}

output "alb_dns_name" {
  value       = module.alb.alb_dns_name
  description = "Public DNS of the Application Load Balancer"
}

output "bastion_public_ip" {
  value       = module.compute.bastion_public_ip
  description = "Public IP address of the Bastion host"
}

output "rds_endpoint" {
  value       = module.rds.db_endpoint
  description = "Endpoint address of the RDS MySQL instance"
}
