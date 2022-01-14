resource "aws_internet_gateway" "My-Internet-IGW" {
  vpc_id = aws_vpc.MyVPC.id

  tags = {
    Name        = "${var.clienet}-InternetGW-${var.env}"
    Environment = "${var.env}"
  }
}


resource "aws_route_table" "My-Public-RT" {
  vpc_id = aws_vpc.MyVPC.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.My-Internet-IGW.id
  }

  tags = {
    Name        = "${var.clienet}-Pub-RT-${var.env}"
    Environment = "${var.env}"
  }
}

resource "aws_route_table_association" "My-Pub-RT-a" {
  subnet_id      = aws_subnet.Public-subnet_01.id
  route_table_id = aws_route_table.My-Public-RT.id
}

resource "aws_route_table_association" "My-Pub-RT-b" {
  subnet_id      = aws_subnet.Public-subnet_02.id
  route_table_id = aws_route_table.My-Public-RT.id
}

resource "aws_route_table_association" "My-Pub-RT-c" {
  subnet_id      = aws_subnet.Public-subnet_03.id
  route_table_id = aws_route_table.My-Public-RT.id
}

