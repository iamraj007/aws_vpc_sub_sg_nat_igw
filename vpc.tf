

resource "aws_vpc" "MyVPC" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  instance_tenancy     = "default"



  tags = {
    Name        = "${var.clienet}-VPC-${var.env}"
    Product     = "${var.clienet}"
    Location    = "${var.region}"
    Environment = "${var.env}"
  }
}
