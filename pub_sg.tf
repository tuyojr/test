locals {
  inbound_ports = [80, 443, 22]
}

resource "aws_security_group" "testPubSG" {
  name        = var.tags[3]
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.webVPC.id

  dynamic "ingress" {
    for_each = local.inbound_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      description = "Inbound traffic from the internet."
      cidr_blocks = [var.cidr_block[1]]
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