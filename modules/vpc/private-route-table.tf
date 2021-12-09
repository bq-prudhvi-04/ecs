
#private Route Table for the Nat Gateway


resource "aws_route_table" "private_route_table" {
  depends_on = [
    aws_nat_gateway.task_nat_gateway
  ]

  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.task_nat_gateway.id
  }

  tags = {
    Name = "private-route-${var.environment}-${var.application}"
  }

}
