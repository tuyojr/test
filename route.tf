resource "aws_route_table" "testRouteTable" {
  vpc_id = aws_vpc.testVPC.id

  tags = {
    Name = var.tags[1]
  }
}

resource "aws_route_table_association" "pubSubnetsRouteAssoc" {
  count = length(var.subnet_cidr_block)
  subnet_id      = aws_subnet.testSubnet[count.index].id
  route_table_id = aws_route_table.testRouteTable.id
}

resource "aws_route" "testRoute" {
  gateway_id = aws_internet_gateway.testGW.id
  route_table_id = aws_route_table.testRouteTable.id
  destination_cidr_block = var.cidr_block[1]
}