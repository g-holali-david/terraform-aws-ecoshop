# Input variables for the RDS module

variable "db_subnet_ids" {
  description = "List of private subnets for the RDS DB Subnet Group"
  type        = list(string)
}

variable "sg_db_id" {
  description = "Security Group ID allowing access to the RDS instance"
  type        = string
}

variable "db_name" {
  description = "Name of the MySQL database"
  type        = string
}

variable "db_username" {
  description = "Master username for the RDS instance"
  type        = string
}

variable "db_password" {
  description = "Master password for the RDS instance"
  type        = string
  sensitive   = true
}
