resource "aws_db_subnet_group" "ecoshop" {
  name       = "ecoshop-db-subnet-group"
  subnet_ids = var.db_subnet_ids
  tags       = { Name = "EcoShop DB Subnet Group" }
}

resource "aws_db_instance" "ecoshop_db" {
  identifier           = "ecoshop-db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  storage_type         = "gp2"
  multi_az             = true
  db_name              = "ecoshop"
  username             = var.db_username
  password             = var.db_password
  db_subnet_group_name = aws_db_subnet_group.ecoshop.name
  vpc_security_group_ids = [var.sg_db_id]
  skip_final_snapshot  = true

  tags = { Name = "EcoShop RDS Instance" }
}