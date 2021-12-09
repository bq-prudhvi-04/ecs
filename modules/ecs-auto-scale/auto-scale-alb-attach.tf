resource "aws_autoscaling_attachment" "asg_attachment_bar" {
  autoscaling_group_name = aws_autoscaling_group.webserver_AG.id
  alb_target_group_arn   = var.aws_lb_target_group
}