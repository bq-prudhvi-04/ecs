
# Private subnet


resource "aws_subnet" "private_subnet_3" {
  depends_on = [
    aws_vpc.task_vpc
  ]

  vpc_id            = aws_vpc.task_vpc.id
  cidr_block        = var.private_cidr-3
  availability_zone = var.availability_zone-3

  tags = {
    Name =   "private-subnet-3-${var.environment}-${var.application}"                              
  }
}
