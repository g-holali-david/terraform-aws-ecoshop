# Project and general tags
project_name        = "ecoshop"
environment         = "prod"
region              = "eu-west-3" # Paris (France)
availability_zones  = ["eu-west-3a", "eu-west-3b"]

# VPC settings
vpc_cidr            = "10.0.0.0/16"
vpc_name            = "ecoshop-vpc"

# Public Subnets (Web tier)
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

# Private Subnets (App tier)
private_app_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24"]

# Private Subnets (DB tier)
private_db_subnet_cidrs = ["10.0.100.0/24", "10.0.200.0/24"]

# NAT Gateway
enable_nat_gateway = true

# Bastion Host
bastion_instance_type = "t3.micro"
bastion_ami_id        = "ami-0c1c30571d2dae5c9" # Amazon Linux 2 (Paris)
bastion_key_name      = "ecoshop-key"

# Web/App Servers
app_instance_count    = 2
app_instance_type     = "t3.small"
app_ami_id            = "ami-0c1c30571d2dae5c9" # Amazon Linux 2 (Paris)

# RDS Configuration
rds_db_name           = "ecoshop"
rds_username          = "admin"
rds_password          = "EcoShop2024!"
rds_instance_class    = "db.t3.micro"
rds_storage_gb        = 20
rds_multi_az          = true

# Load Balancer
alb_name              = "ecoshop-alb"
