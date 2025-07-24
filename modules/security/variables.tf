variable "vpc_id" {
  type = string
}

variable "admin_ip" {
  type        = string
  description = "Public IP for Bastion SSH access"
}