vpc_cidr           = "10.0.0.0/16"
azs                = ["eu-west-1a", "eu-west-1b"]

web_subnet_cidrs   = ["10.0.1.0/24", "10.0.2.0/24"]
app_subnet_cidrs   = ["10.0.10.0/24", "10.0.20.0/24"]
db_subnet_cidrs    = ["10.0.100.0/24", "10.0.200.0/24"]

admin_ip = "92.92.126.125/32"
key_name           = "ecoshop-key"

# Amazon Linux 2 AMI (HVM), SSD Volume Type pour eu-west-1 (Irlande) - validée le 24 juillet 2025

bastion_ami = "ami-0214c80a20a6f5239" 
app_ami     = "ami-0214c80a20a6f5239" 

bastion_instance_type = "t3.micro"
app_instance_type     = "t3.small"
