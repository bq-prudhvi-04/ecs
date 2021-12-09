
# Routing table association for  public subnet


resource "aws_route_table_association" "public_route_association_1" {

  depends_on = [
    aws_vpc.task_vpc,
    aws_subnet.public_subnet_1,
    aws_route_table.public_route_table
  ]

  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public_route_table.id
}
