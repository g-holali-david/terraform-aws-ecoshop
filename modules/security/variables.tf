# Input variables for the security module

variable "vpc_id" {
  description = "ID of the VPC where security groups will be created"
  type        = string
}

variable "my_ip" {
  description = "Public IP address of the administrator for SSH access to bastion"
  type        = string
}
