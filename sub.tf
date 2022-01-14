
#Public Subnet-a
resource "aws_subnet" "Public-subnet_01" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = var.pub_subnet_01
  map_public_ip_on_launch = "true" #To make it Public
  availability_zone       = var.av_zone-1

  tags = {
    Name        = "${var.clienet}-Pub-Subnet-01-${var.env}"
    Environment = "${var.env}"
  }
}


#Public Subnet-b
resource "aws_subnet" "Public-subnet_02" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = var.pub_subnet_02
  map_public_ip_on_launch = "true" #To make it Public
  availability_zone       = var.av_zone-2

  tags = {
    Name        = "${var.clienet}-Pub-Subnet-02-${var.env}"
    Environment = "${var.env}"
  }
}

#Public Subnet-c
resource "aws_subnet" "Public-subnet_03" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = var.pub_subnet_03
  map_public_ip_on_launch = "true" #To make it Public
  availability_zone       = var.av_zone-3

  tags = {
    Name        = "${var.clienet}-Pub-Subnet-03-${var.env}"
    Environment = "${var.env}"
  }
}

#Private Subnet - 1
resource "aws_subnet" "Private-subnet_01" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = var.pvt_subnet_01
  map_public_ip_on_launch = "false" #To make it private
  availability_zone       = var.av_zone-1

  tags = {
    Name        = "${var.clienet}-Pvt-Subnet-01-${var.env}"
    Environment = "${var.env}"
  }
}


#Private Subnet - 1
resource "aws_subnet" "Private-subnet_02" {
  vpc_id                  = aws_vpc.MyVPC.id
  cidr_block              = var.pvt_subnet_02
  map_public_ip_on_launch = "false" #To make it private
  availability_zone       = var.av_zone-2

  tags = {
    Name        = "${var.clienet}-Pvt-Subnet-02-${var.env}"
    Environment = "${var.env}"
  }
}

