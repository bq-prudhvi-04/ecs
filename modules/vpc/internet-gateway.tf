# internet gateway

resource "aws_internet_gateway" "task_IGW" {
  depends_on = [
    aws_vpc.task_vpc
  ]

  vpc_id = aws_vpc.task_vpc.id

  tags = {
    Name = "IGW-${var.environment}-${var.application}"
  }
}
