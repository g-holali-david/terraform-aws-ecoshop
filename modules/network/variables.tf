// CIDR block for the VPC
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the main VPC"
}

// Name for the VPC
variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

// Availability Zones to use
variable "azs" {
  type        = list(string)
  description = "List of Availability Zones to use"
}

// CIDRs for the public subnets (must match number of AZs)
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

// CIDRs for the private subnets (application tier)
variable "private_app_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets (app tier)"
}

// CIDRs for the private subnets (database tier)
variable "private_db_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets (db tier)"
}
