# Input variables for the compute module

variable "ami_id" {
  description = "AMI ID for Amazon Linux 2"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH key pair name for accessing EC2 instances"
  type        = string
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs (for Bastion Host)"
  type        = list(string)
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs (for application servers)"
  type        = list(string)
}

variable "sg_app_id" {
  description = "Security Group ID for App Tier"
  type        = string
}

variable "sg_bastion_id" {
  description = "Security Group ID for Bastion Host"
  type        = string
}
