resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main-vpc.id
  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "main-public-crt" {
  vpc_id = aws_vpc.main-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name = "main-public-crt"
  }
}

resource "aws_route_table_association" "main-crta-public-subnet-1" {
  subnet_id      = aws_subnet.main-subnet-public-1.id
  route_table_id = aws_route_table.main-public-crt.id
}

resource "aws_route_table_association" "main-crta-public-subnet-2" {
  subnet_id      = aws_subnet.main-subnet-public-2.id
  route_table_id = aws_route_table.main-public-crt.id
}

resource "aws_db_subnet_group" "db" {
  subnet_ids = [aws_subnet.main-subnet-public-1.id, aws_subnet.main-subnet-public-2.id]
}
