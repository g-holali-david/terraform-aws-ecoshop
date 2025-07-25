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
  description = "Nom d'utilisateur pour la base de données RDS"
  type        = string
}

variable "db_password" {
  description = "Mot de passe de la base de données RDS"
  type        = string
  sensitive   = true
}
