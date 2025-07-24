# This module defines the security groups required for the 3-tier architecture.

resource "aws_security_group" "sg_web" {
  name        = "sg-web"
  description = "Allow HTTP/HTTPS from the Internet"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-web"
  }
}

resource "aws_security_group" "sg_app" {
  name        = "sg-app"
  description = "Allow traffic from web tier and SSH from bastion"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow HTTP from web tier"
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_web.id]
  }

  ingress {
    description     = "Allow SSH from bastion"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_bastion.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-app"
  }
}

resource "aws_security_group" "sg_db" {
  name        = "sg-db"
  description = "Allow MySQL from app tier"
  vpc_id      = var.vpc_id

  ingress {
    description     = "Allow MySQL from app tier"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_app.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-db"
  }
}

resource "aws_security_group" "sg_bastion" {
  name        = "sg-bastion"
  description = "Allow SSH from your IP only"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH from my IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg-bastion"
  }
}
