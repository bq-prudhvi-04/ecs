

module "vpc" {
  source              = "../../modules/vpc"
  environment         = var.environment
  vpc_cidr            = var.vpc_cidr
  availability_zone-1 = var.availability_zone-1
  availability_zone-2 = var.availability_zone-2
  availability_zone-3 = var.availability_zone-3
  public_cidr-1       = var.public_cidr-1
  public_cidr-2       = var.public_cidr-2
  private_cidr-1      = var.private_cidr-1
  private_cidr-2      = var.private_cidr-2
  private_cidr-3      = var.private_cidr-3
  application         = var.application

}

module "ecs-auto-scale" {
  source              = "../../modules/ecs-auto-scale"
  instance_type       = var.instance_type
  image_id            = var.image_id
  security_groups     = module.security-groups.security_groups_webserver
  key_name            = var.key_name
  private_subnet      = [module.vpc.private_subnet_1, module.vpc.private_subnet_2, module.vpc.private_subnet_3]
  aws_lb_target_group = module.alb.aws_lb_target_group

}

module "security-groups" {
  source = "../../modules/security-groups"
  vpc_id = module.vpc.vpc_id


}


module "alb" {
  source          = "../../modules/Load-balancer"
  ec2_count       = var.ec2_count
  vpc_id          = module.vpc.vpc_id
  public_subnet   = [module.vpc.public_subnet_1, module.vpc.public_subnet_2]
  security_groups = module.security-groups.security_groups_webserver

}

module "ecs" {
  source                 = "../../modules/ecs"
  aws_lb_target_group    = module.alb.aws_lb_target_group
  auto_scaling_group_arn = module.ecs-auto-scale.aws_autoscaling_group_arn
  iam_role    =  module.ecs-auto-scale.ecs_iam_role

}



