# ------------------------------------------------------------
# Input variables for EcoShop infrastructure deployment
# ------------------------------------------------------------

variable "aws_region" {
  description = "AWS region to deploy resources in"
  type        = string
  default     = "eu-west-3"
}

variable "vpc_cidr" {
  description = "CIDR block for the main VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "azs" {
  description = "List of availability zones to use"
  type        = list(string)
  default     = ["eu-west-3a", "eu-west-3b"]
}

variable "bastion_cidr" {
  description = "Your public IP to allow SSH access to bastion host"
  type        = string
  default     = "YOUR_PUBLIC_IP/32"
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "instance_key_name" {
  description = "Name of the EC2 SSH key pair"
  type        = string
}

variable "db_username" {
  description = "RDS database admin username"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "RDS database admin password"
  type        = string
  sensitive   = true
}
