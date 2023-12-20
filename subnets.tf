resource "aws_subnet" "testSubnet" {
  count = length(var.subnet_cidr_block)

  vpc_id            = aws_vpc.testVPC.id
  cidr_block        = var.subnet_cidr_block[count.index + 1]
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name = var.tag[count.index + 1]
  }
}