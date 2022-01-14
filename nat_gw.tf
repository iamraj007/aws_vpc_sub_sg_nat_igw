resource "aws_eip" "MyNat-eip" {
  vpc = true

  tags = {
    Name        = "${var.clienet}-EIP-NAT-${var.env}"
    Environment = "${var.env}"
  }

}

resource "aws_nat_gateway" "MyNAT-GW" {
  allocation_id = aws_eip.MyNat-eip.id
  subnet_id     = aws_subnet.Public-subnet_01.id
  #  subnet_id     = "$${"aws_subnet.Public-subnet_01.id", "aws_subnet.Public-subnet_02.id"}"
  depends_on = [aws_internet_gateway.My-Internet-IGW]

  tags = {
    Name        = "${var.clienet}-NAT-GW-${var.env}"
    Environment = "${var.env}"
  }
}

resource "aws_route_table" "Private-RT" {
  vpc_id = aws_vpc.MyVPC.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.MyNAT-GW.id
  }
  tags = {
    Name        = "${var.clienet}-Pvt-RT-${var.env}"
    Environment = "${var.env}"
  }

}

resource "aws_route_table_association" "Private-RTA" {
  subnet_id      = aws_subnet.Private-subnet_01.id
  route_table_id = aws_route_table.Private-RT.id
}

resource "aws_route_table_association" "Private-RTA-02" {
  subnet_id      = aws_subnet.Private-subnet_02.id
  route_table_id = aws_route_table.Private-RT.id
}



