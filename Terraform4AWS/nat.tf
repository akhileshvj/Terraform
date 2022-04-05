#Define External Ip resource

resource "aws_eip" "levelup-nat-eip" {
  vpc      = true
}
resource "aws_nat_gateway" "levelup-nat-gw" {
  subnet_id = aws_subnet.levelupvpc_public_1.id
  allocation_id = aws_eip.levelup-nat-eip.id
  depends_on = [aws_internet_gateway.levelup-gw]
}
resource "aws_route_table" "levelup_private_route" {
  vpc_id = aws_vpc.levelup_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.levelup-nat-gw.id
  }
  tags = {
    Name = "levelup_private_route"
  }
}

resource "aws_route_table_association" "levelup-private-1a" {
  subnet_id      = aws_subnet.levelupvpc_private_1.id
  route_table_id = aws_route_table.levelup_private_route.id
}
resource "aws_route_table_association" "levelup-private-2a" {
  subnet_id      = aws_subnet.levelupvpc_private_2.id
  route_table_id = aws_route_table.levelup_private_route.id
}
resource "aws_route_table_association" "levelup-private-3a" {
  subnet_id      = aws_subnet.levelupvpc_private_3.id
  route_table_id = aws_route_table.levelup_private_route.id
}