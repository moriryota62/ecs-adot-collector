resource "aws_ecs_service" "this" {
  name                   = "${var.base_name}-${var.service_name}"
  cluster                = var.base_name
  task_definition        = aws_ecs_task_definition.this.arn
  scheduling_strategy    = "DAEMON"
  enable_execute_command = false # ECS Exec

  tags = {
    "Name" = "${var.base_name}-${var.service_name}"
  }
}