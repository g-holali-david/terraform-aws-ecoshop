# ------------------------------------------------------------
# Root Terraform Configuration for EcoShop AWS Infrastructure
# This file orchestrates the different modules (network, security, compute, rds, alb)
# ------------------------------------------------------------

provider "aws" {
  region = var.aws_region
}

# -------------------------------
# Network Module (VPC, Subnets)
# -------------------------------
module "network" {
  source = "./modules/network"

  vpc_cidr = var.vpc_cidr
  azs      = var.azs
}

# -------------------------------
# Security Groups
# -------------------------------
module "security" {
  source = "./modules/security"

  vpc_id        = module.network.vpc_id
  bastion_cidr  = var.bastion_cidr
}

# -------------------------------
# Compute (EC2 Web/App + Bastion)
# -------------------------------
module "compute" {
  source = "./modules/compute"

  vpc_id              = module.network.vpc_id
  private_subnet_ids  = module.network.private_app_subnet_ids
  sg_app_id           = module.security.sg_app_id
  sg_bastion_id       = module.security.sg_bastion_id
  ami_id              = var.ami_id
  instance_key_name   = var.instance_key_name
}

# -------------------------------
# RDS MySQL Database
# -------------------------------
module "rds" {
  source = "./modules/rds"

  db_subnet_ids = module.network.private_db_subnet_ids
  vpc_id        = module.network.vpc_id
  sg_db_id      = module.security.sg_db_id
  db_username   = var.db_username
  db_password   = var.db_password
}

# -------------------------------
# Application Load Balancer
# -------------------------------
module "alb" {
  source = "./modules/alb"

  vpc_id            = module.network.vpc_id
  public_subnet_ids = module.network.public_subnet_ids
  sg_web_id         = module.security.sg_web_id
}
