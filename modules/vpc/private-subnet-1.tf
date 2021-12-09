
# Private subnet


resource "aws_subnet" "private_subnet_1" {
  depends_on = [
    aws_vpc.task_vpc
  ]

  vpc_id            = aws_vpc.task_vpc.id
  cidr_block        = var.private_cidr-1
  availability_zone = var.availability_zone-1

  tags = {
   Name =  "private-subnet-1-${var.environment}-${var.application}"                              
  }
}
