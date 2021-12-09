
# Private subnet


resource "aws_subnet" "private_subnet_2" {
  depends_on = [
    aws_vpc.task_vpc
  ]

  vpc_id            = aws_vpc.task_vpc.id
  cidr_block        = var.private_cidr-2
  availability_zone = var.availability_zone-2

  tags = {
     Name =  "private-subnet-2-${var.environment}-${var.application}"                              
  }
}
