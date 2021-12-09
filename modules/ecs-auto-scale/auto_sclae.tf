resource "aws_autoscaling_group" "webserver_AG" {
  desired_capacity   = 2
  max_size           = 3
  min_size           = 2
  vpc_zone_identifier = var.private_subnet
  launch_configuration = aws_launch_configuration.LT_webserver.name
}

resource "aws_autoscaling_policy" "webserver" {

  name                   = "webserver"
  autoscaling_group_name = aws_autoscaling_group.webserver_AG.name
  policy_type             = "TargetTrackingScaling"

   target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 40.0
  }
}