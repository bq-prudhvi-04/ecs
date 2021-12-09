
# NAT Gateway

resource "aws_nat_gateway" "task_nat_gateway" {
  depends_on = [
    aws_eip.task_nat_gateway_eip,
    aws_subnet.public_subnet_1
  ]

  allocation_id = aws_eip.task_nat_gateway_eip.id
  subnet_id     = aws_subnet.public_subnet_1.id
  tags = {
    Name = "nat_gateway-${var.environment}-${var.application}"
  }
}
