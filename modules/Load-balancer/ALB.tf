
resource "aws_lb" "test-alb" {
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet
  security_groups    = [var.security_groups]

  
  tags = {
    Name = "test-alb"
  }
}


resource "aws_alb_listener" "test-alb_listener" {
  load_balancer_arn = aws_lb.test-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.test-target-gp.arn
  }
}