resource "aws_launch_configuration" "LT_webserver" {
  name_prefix   = "webserver"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  security_groups = [var.security_groups]

  iam_instance_profile        = aws_iam_instance_profile.ecs_service_role.name
  
  user_data = filebase64("./ecs.sh")

        

}