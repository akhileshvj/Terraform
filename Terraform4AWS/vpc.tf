#Create AWS VPC
resource "aws_vpc" "levelup_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"

  tags = {
    Name = "levelup_vpc"
  }
}
#Define Public Subnet
resource "aws_subnet" "levelupvpc_public_1" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "levelupvpc_public_1"
  }
}
resource "aws_subnet" "levelupvpc_public_2" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1b"

  tags = {
    Name = "levelupvpc_public_2"
  }
}
resource "aws_subnet" "levelupvpc_public_3" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1c"

  tags = {
    Name = "levelupvpc_public_3"
  }
}

#Define Private subnet
resource "aws_subnet" "levelupvpc_private_1" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1a"

  tags = {
    Name = "levelupvpc_private_1"
  }
}
resource "aws_subnet" "levelupvpc_private_2" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1b"

  tags = {
    Name = "levelupvpc_private_2"
  }
}
resource "aws_subnet" "levelupvpc_private_3" {
  vpc_id     = aws_vpc.levelup_vpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone = "us-east-1c"

  tags = {
    Name = "levelupvpc_private_3"
  }
}
####internet GATEWAYYYY
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.levelup_vpc.id

  tags = {
    Name = "levelup-gw"
  }
}
###Routing Table
resource "aws_route_table" "levelup-route" {
  vpc_id = aws_vpc.levelup_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }
  tags = {
    Name = "levelup-route"
  }
}
resource "aws_route_table_association" "levelup-public-1a" {
  subnet_id      = aws_subnet.levelupvpc_public_1.id
  route_table_id = aws_route_table.levelup-route.id
}
resource "aws_route_table_association" "levelup-public-2a" {
  subnet_id      = aws_subnet.levelupvpc_public_2.id
  route_table_id = aws_route_table.levelup-route.id
}
resource "aws_route_table_association" "levelup-public-3a" {
  subnet_id      = aws_subnet.levelupvpc_public_3.id
  route_table_id = aws_route_table.levelup-route.id
}