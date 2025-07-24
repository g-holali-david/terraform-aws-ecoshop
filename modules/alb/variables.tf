variable "vpc_id" {
  type        = string
  description = "ID du VPC"
}

variable "sg_web_id" {
  type        = string
  description = "Security Group pour le ALB"
}

variable "web_subnet_ids" {
  type        = list(string)
  description = "Subnets publics pour le ALB"
}

variable "target_instance_ids" {
  type        = list(string)
  description = "Liste des IDs des serveurs app à attacher"
}