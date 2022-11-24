resource "aws_cloudwatch_log_group" "this" {
  name = "/ecs/${var.base_name}-${var.service_name}"

  tags = {
    name = "/ecs/${var.base_name}-${var.service_name}"
  }
}