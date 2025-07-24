provider "aws" {
  region = "eu-west-1"
}

resource "tls_private_key" "ecoshop" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ecoshop_key" {
  key_name   = "ecoshop-key"
  public_key = tls_private_key.ecoshop.public_key_openssh

  lifecycle {
    ignore_changes = [public_key]
  }
}

module "network" {
  source = "./modules/network"

  vpc_cidr         = var.vpc_cidr
  azs              = var.azs
  web_subnet_cidrs = var.web_subnet_cidrs
  app_subnet_cidrs = var.app_subnet_cidrs
  db_subnet_cidrs  = var.db_subnet_cidrs
}

module "security" {
  source   = "./modules/security"
  vpc_id   = module.network.vpc_id
  admin_ip = var.admin_ip
}

module "compute" {
  source = "./modules/compute"

  key_name           = aws_key_pair.ecoshop_key.key_name
  bastion_ami        = var.bastion_ami
  bastion_subnet_id  = module.network.public_subnets[0]
  sg_bastion_id      = module.security.sg_bastion_id

  app_ami            = var.app_ami
  app_subnet_ids     = module.network.private_app_subnets
  sg_app_id          = module.security.sg_app_id
  depends_on         = [module.network]
}

module "rds" {
  source = "./modules/rds"

  db_subnet_ids = module.network.db_subnets
  vpc_id        = module.network.vpc_id
  sg_db_id      = module.security.sg_db_id
}


module "alb" {
  source              = "./modules/alb"
  web_subnet_ids      = module.network.web_subnets
  vpc_id              = module.network.vpc_id
  target_instance_ids = module.compute.app_instance_ids 
  sg_web_id           = module.security.sg_web_id
}
