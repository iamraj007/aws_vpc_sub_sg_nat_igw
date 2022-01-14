resource "aws_security_group" "sg-http-allow-pub" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "HTTP-Allow-pub-${var.env}"
  description = "Allow HTTP Port Ingress from pub!"

  tags = {
    Name        = "${var.clienet}-HTTP-Allow-Pub-${var.env}"
    Environment = "${var.env}"

  }

  egress {
    description = "Allow out traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow http ingress"
    from_port   = var.http
    to_port     = var.http
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow http secure port ingress"
    from_port   = var.http_secure
    to_port     = var.http_secure
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8080  port ingress"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow 8081  port ingress"
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "sg-ssh-allow-pvt" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "SSH-Allow-pvt-${var.env}"
  description = "Allow SSH Port Ingress from Pvt!"

  tags = {
    Name = "${var.clienet}-SSH-Allow-Pvt-${var.env}"
  }

  ingress {
    description = "Allow SSH Port Ingress from Pvt only"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.pvt_subnet_01]
  }

  ingress {
    description = "Allow SSH Port Ingress from Pvt only"
    #  description = "Allow SSH Port Ingress from "${Private-subnet_01}" Pvt only"
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = "tcp"
    cidr_blocks = [var.pvt_subnet_02]
  }

  egress {
    description = "Allow out traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "rdp-allow-pvt" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "RDP-Allow-pvt-${var.env}"
  description = "Allow RDP Port Ingress from Pvt!"

  tags = {
    Name        = "${var.clienet}-SSH-Allow-Pvt-${var.env}"
    Environment = "${var.env}"

  }

  ingress {
    description = "Allow RDP Port Ingress from Pvt only"
    from_port   = var.rdp_port
    to_port     = var.rdp_port
    protocol    = "tcp"
    cidr_blocks = [var.pvt_subnet_01, var.pvt_subnet_02]
  }


  egress {
    description = "Allow out traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_security_group" "sg-webport-allow-pub" {
  vpc_id      = aws_vpc.MyVPC.id
  name        = "Web-allow-pvt-${var.env}"
  description = "Allow Web App Port Ingress from Pub!"

  tags = {
    Name        = "${var.clienet}-Web-Allow-Pub-${var.env}"
    Environment = "${var.env}"

  }

  ingress {
    description = "Allow Web Port Ingress from Pub only"
    from_port   = lookup(var.web_port, var.web_var)
    to_port     = lookup(var.web_port, var.web_var)
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


