resource "aws_vpc" "main-vpc" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_hostnames = true
  tags = {
    Name = "${var.vpc_name}"
  }
}

resource "aws_subnet" "main-subnet-public-1" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.10.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.aws_availability_zone_1
  tags = {
    Name = "main-subnet-public-1"
  }
}

resource "aws_subnet" "main-subnet-public-2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.10.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.aws_availability_zone_2
  tags = {
    Name = "main-subnet-public-2"
  }
}

resource "aws_subnet" "main-subnet-private-1" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.10.3.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.aws_availability_zone_1
  tags = {
    Name = "main-subnet-private-1"
  }
}

resource "aws_subnet" "main-subnet-private-2" {
  vpc_id                  = aws_vpc.main-vpc.id
  cidr_block              = "10.10.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.aws_availability_zone_2
  tags = {
    Name = "main-subnet-private-2"
  }
}
