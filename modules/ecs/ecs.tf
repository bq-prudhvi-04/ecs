resource "aws_ecs_cluster" "web-cluster" {
  name = "demo"
  capacity_providers = [aws_ecs_capacity_provider.test.name]
  depends_on = [aws_ecs_capacity_provider.test]
  tags = {
    name = "demo"
  }
}

resource "aws_ecs_capacity_provider" "test" {
  name = "capacity-provider-test"
  auto_scaling_group_provider {
    auto_scaling_group_arn         = var.auto_scaling_group_arn
    
   
  }
}

# update file container-def, so it's pulling image from ecr
resource "aws_ecs_task_definition" "task-definition-test" {
  family                = "web-family"
  container_definitions = file("./container-def.json")
  network_mode          = "bridge"
  tags = {
    name = "demo"
 
  }
}

resource "aws_ecs_service" "service" {
  name            = "web-service"
  cluster         = aws_ecs_cluster.web-cluster.id
  task_definition = aws_ecs_task_definition.task-definition-test.arn
  desired_count   = 3
  iam_role = aws_iam_role.ecs-service-role.arn
  depends_on      = [aws_iam_role.ecs-service-role]
  ordered_placement_strategy {
    type  = "binpack"
    field = "cpu"
  }
  load_balancer {
    target_group_arn = var.aws_lb_target_group
    container_name   = "demo"
    container_port   = 80
  }
  
  
  launch_type = "EC2"
  #depends_on  = [aws_lb_listener.test-alb_listener]
}


