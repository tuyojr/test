locals {
    subnets_cidr = [var.subnet_cidr_block[0], var.subnet_cidr_block[2],var.subnet_cidr_block[4]]
    instance_name = ["priv"]
}

data "aws_ami" "amazon_linux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["Amazon Linux 2023*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "testServers" {
  count         = length(var.availability_zones)
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_pair
  subnet_id     = aws_subnet.testSubnet[count.index].id
  vpc_security_group_ids = [
    aws_security_group.testSG.id
  ]
  associate_public_ip_address = false
  availability_zone = var.availability_zones[count.index]
  tags = {
    Name = "${local.instance_name[count.index]}${count.index}"
  }
}