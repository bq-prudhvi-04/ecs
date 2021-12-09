
# Public Subnet-2

resource "aws_subnet" "public_subnet_2" {

  depends_on = [
    aws_vpc.task_vpc
  ]

  vpc_id                  = aws_vpc.task_vpc.id
  cidr_block              = var.public_cidr-2
  availability_zone       = var.availability_zone-2
  map_public_ip_on_launch = true

  tags = {

    Name   =  "public-subnet-2_${var.environment}_${var.application}"          
                                                 
  }
}
