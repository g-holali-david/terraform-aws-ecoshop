resource "aws_vpc" "ecosop" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = { Name = "ecosop-vpc" }
}

resource "aws_subnet" "web_public" {
  count                = 2
  vpc_id               = aws_vpc.ecosop.id
  cidr_block           = var.web_subnet_cidrs[count.index]
  availability_zone    = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = { Name = "web-public-${var.azs[count.index]}" }
}

resource "aws_subnet" "app_private" {
  count             = 2
  vpc_id            = aws_vpc.ecosop.id
  cidr_block        = var.app_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = { Name = "app-private-${var.azs[count.index]}" }
}

resource "aws_subnet" "db_private" {
  count             = 2
  vpc_id            = aws_vpc.ecosop.id
  cidr_block        = var.db_subnet_cidrs[count.index]
  availability_zone = var.azs[count.index]
  tags = { Name = "db-private-${var.azs[count.index]}" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.ecosop.id
  tags = { Name = "ecosop-igw" }
}

resource "aws_eip" "nat" {
  tags = { Name = "ecosop-eip-nat" }
}


resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.web_public[0].id
  tags = { Name = "ecosop-nat" }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.ecosop.id
  tags   = { Name = "public-rt" }
}

resource "aws_route" "public_internet" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "web_subnet_assoc" {
  count          = 2
  subnet_id      = aws_subnet.web_public[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

