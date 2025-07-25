variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "web_subnet_cidrs" {
  type = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "app_subnet_cidrs" {
  type = list(string)
  default = ["10.0.10.0/24", "10.0.20.0/24"]
}

variable "db_subnet_cidrs" {
  type = list(string)
  default = ["10.0.100.0/24", "10.0.200.0/24"]
}

variable "admin_ip" {
  type        = string
  description = "Adresse IP publique autorisée pour accéder au Bastion"
}

variable "key_name" {
  type        = string
  description = "Nom de la clé SSH utilisée pour accéder aux serveurs EC2"
}

variable "app_ami" {
  description = "AMI ID for app servers"
  type        = string
}

variable "bastion_ami" {
  type        = string
  description = "AMI pour le Bastion Host"
  default     = "ami-089c2b9a8b7cfd3df"
}

variable "bastion_instance_type" {
  description = "Type d'instance pour le Bastion"
  type        = string
  default     = "t3.micro"
}

variable "app_instance_type" {
  description = "Type d'instance pour les serveurs applicatifs"
  type        = string
  default     = "t3.small"
}


variable "db_username" {
  description = "Nom d'utilisateur principal pour la base de données"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Mot de passe de l'utilisateur principal de la base de données"
  type        = string
  sensitive   = true
  default     = "EcoShop2025!"
}

