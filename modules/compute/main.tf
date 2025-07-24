resource "aws_instance" "bastion" {
  ami                    = var.bastion_ami
  instance_type          = var.bastion_instance_type
  subnet_id              = var.bastion_subnet_id
  vpc_security_group_ids = [var.sg_bastion_id]
  key_name               = var.key_name

  tags = { Name = "BastionHost" }
}

resource "aws_instance" "app_servers" {
  count                  = length(var.app_subnet_ids)
  ami                    = var.app_ami
  instance_type          = var.app_instance_type
  subnet_id              = var.app_subnet_ids[count.index]
  vpc_security_group_ids = [var.sg_app_id]
  key_name               = var.key_name

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd php mysql
              systemctl start httpd
              systemctl enable httpd
              echo "Server: $(hostname)" >> /var/www/html/index.php
              EOF

  tags = { Name = "AppServer-${count.index + 1}" }
}