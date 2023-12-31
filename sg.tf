locals {
  inbound_ports = [80, 443, 22, 8080]
}

resource "aws_security_group" "testSG" {
  name        = var.tags[3]
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.testVPC.id
  # count = length(var.subnet_cidr_block)

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      description = "Inbound traffic from instances created."
      cidr_blocks = [var.cidr_block[1], var.subnet_cidr_block[0], var.subnet_cidr_block[1], var.subnet_cidr_block[2], var.subnet_cidr_block[3], var.subnet_cidr_block[4], var.subnet_cidr_block[5]]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.cidr_block[1]]
  }

  tags = {
    Name = var.tags[3]
  }
}