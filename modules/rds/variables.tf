variable "vpc_id" {
  description = "ID du VPC pour la base de données RDS"
  type        = string
}

variable "db_subnet_ids" {
  type        = list(string)
  description = "Liste des subnets privés DB tier"
}

variable "sg_db_id" {
  type        = string
  description = "Security Group pour la base MySQL"
}

variable "db_username" {
  type        = string
  default     = "admin"
  description = "Nom d'utilisateur pour la base"
}

variable "db_password" {
  type        = string
  default     = "EcoShop2024!"
  description = "Mot de passe sécurisé"
}