
# Public Subnet

resource "aws_subnet" "public_subnet_1" {

  depends_on = [
    aws_vpc.task_vpc
  ]

  vpc_id                  = aws_vpc.task_vpc.id
  cidr_block              = var.public_cidr-1
  availability_zone       = var.availability_zone-1
  map_public_ip_on_launch = true

  tags  = {
    Name   =  "public-subnet-1_${var.environment}_${var.application}"                              
                                                 
  }
}
