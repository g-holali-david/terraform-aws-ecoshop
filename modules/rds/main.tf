# This module provisions a MySQL RDS instance with Multi-AZ enabled.
# It also creates a DB subnet group with the provided private subnets.

# Create DB Subnet Group
resource "aws_db_subnet_group" "this" {
  name       = "ecoshop-db-subnet-group"
  subnet_ids = var.db_subnet_ids

  tags = {
    Name = "ecoshop-db-subnet-group"
  }
}

# Create RDS instance (MySQL)
resource "aws_db_instance" "this" {
  identifier              = "ecoshop-db"
  allocated_storage       = 20
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t3.micro"
  username                = var.db_username
  password                = var.db_password
  db_name                 = var.db_name
  multi_az                = true
  publicly_accessible     = false
  vpc_security_group_ids  = [var.sg_db_id]
  db_subnet_group_name    = aws_db_subnet_group.this.name
  skip_final_snapshot     = true
  deletion_protection     = false

  tags = {
    Name = "ecoshop-db"
  }
}
