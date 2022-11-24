locals {
  base_name = "ecs-metrics"
}

module "vpc" {
  source = "./vpc"

  base_name            = local.base_name
  vpc_cidr             = "172.17.0.0/16"
  subnet_public_cidrs  = ["172.17.10.0/24", "172.17.11.0/24"]
  subnet_private_cidrs = ["172.17.12.0/24", "172.17.13.0/24"]
}

module "ecs-cluster" {
  source = "./ecs-cluster"

  base_name          = local.base_name
  instance_type      = "t3.medium"
  max_size           = 1
  min_size           = 1
  desired_capacity   = 1
  private_subnet_ids = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
}

module "sample-task-metrics" {
  source = "./sample-task-metrics"

  base_name          = local.base_name
  private_subnet_ids = module.vpc.private_subnet_ids
  service_name       = "task-metrics"
}

module "sample-instance-metrics" {
  source = "./sample-instance-metrics"

  base_name          = local.base_name
  private_subnet_ids = module.vpc.private_subnet_ids
  service_name       = "instance-metrics"
}