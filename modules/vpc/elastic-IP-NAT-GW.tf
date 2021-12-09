
# Elastic IP for the NAT Gateway!


resource "aws_eip" "task_nat_gateway_eip" {
 
   vpc = true

  tags = {
    Name = "nat_gateway_eip-${var.environment}-${var.application}"
  }
  
}
