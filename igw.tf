resource "aws_internet_gateway" "testGW" {
  vpc_id = aws_vpc.testVPC.id

  tags = {
    Name = var.tags[2]
  }
}