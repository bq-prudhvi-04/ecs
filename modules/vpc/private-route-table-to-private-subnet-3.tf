# Route Table Association for the Private Subnet!


resource "aws_route_table_association" "private_route_association_3" {
  depends_on = [
    aws_route_table.private_route_table,
    aws_subnet.private_subnet_3
  ]

  subnet_id      = aws_subnet.private_subnet_3.id
  route_table_id = aws_route_table.private_route_table.id
}
