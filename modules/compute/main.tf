# This module handles the deployment of EC2 instances:
# - One Bastion Host (public)
# - Two App/Web servers (private, across multiple AZs)

# Bastion Host (public subnet)
resource "aws_instance" "bastion" {
  ami                    = var.ami_id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_ids[0]
  vpc_security_group_ids = [var.sg_bastion_id]
  key_name               = var.ssh_key_name

  tags = {
    Name = "ecoshop-bastion"
  }
}

# Application Servers (private subnets, 2 AZs)
resource "aws_instance" "app_servers" {
  count                  = 2
  ami                    = var.ami_id
  instance_type          = "t3.small"
  subnet_id              = var.private_subnet_ids[count.index]
  vpc_security_group_ids = [var.sg_app_id]
  key_name               = var.ssh_key_name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y httpd php mysql
    systemctl start httpd
    systemctl enable httpd
    echo "<?php echo 'Server: ' . gethostname(); ?>" > /var/www/html/index.php
  EOF

  tags = {
    Name = "ecoshop-app-${count.index + 1}"
  }
}
