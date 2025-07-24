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