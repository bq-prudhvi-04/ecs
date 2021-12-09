resource "aws_lb_target_group" "test-target-gp" {
  name     = "test-alb-tg"
  port     = 80
  protocol = "HTTP"
  
  vpc_id   = var.vpc_id

}

