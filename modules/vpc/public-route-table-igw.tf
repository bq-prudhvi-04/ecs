
# Routing table for public subnet


resource "aws_route_table" "public_route_table" {
  depends_on = [
    aws_vpc.task_vpc,
    aws_internet_gateway.task_IGW
  ]

  vpc_id = aws_vpc.task_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.task_IGW.id
  }

  tags = {
    Name = "public-route-table-${var.environment}-${var.application}"
  }
}
