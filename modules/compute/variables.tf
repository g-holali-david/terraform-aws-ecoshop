data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


variable "key_name" {
  type        = string
  description = "Nom de la clé SSH pour les serveurs"
}

variable "bastion_ami" {
  type        = string
  description = "AMI pour le Bastion Host"
  default = "ami-089c2b9a8b7cfd3df" # Amazon Linux 2
}

variable "bastion_instance_type" {
  type    = string
  default = "t3.micro"
}

variable "bastion_subnet_id" {
  type        = string
  description = "Subnet public pour le Bastion"
}

variable "app_ami" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "app_instance_type" {
  type    = string
  default = "t3.small"
}

variable "app_subnet_ids" {
  type        = list(string)
  description = "Liste des subnets privés pour les serveurs applicatifs"
}

variable "sg_app_id" {
  type        = string
  description = "Security Group des serveurs applicatifs"
}

variable "sg_bastion_id" {
  type        = string
  description = "Security Group du Bastion Host"
}

