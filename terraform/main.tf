resource "aws_vpc" "lab_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = "Personal-DevOps-Lab-VPC"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.lab_vpc.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "Personal-DevOps-Lab-Public-Subnet"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.lab_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name        = "Personal-DevOps-Lab-Private-Subnet"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_internet_gateway" "lab_igw" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name        = "Personal-DevOps-Lab-IGW"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.lab_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.lab_igw.id
  }

  tags = {
    Name        = "Personal-DevOps-Lab-Public-RT"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.lab_vpc.id

  tags = {
    Name        = "Personal-DevOps-Lab-Private-RT"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
resource "aws_security_group" "lab_security_group" {
  name        = "Personal-DevOps-Lab-SG"
  description = "Security group for the DevOps lab"
  vpc_id      = aws_vpc.lab_vpc.id

  tags = {
    Name        = "Personal-DevOps-Lab-SG"
    Environment = var.environment
    ManagedBy   = "Terraform"
  }
}