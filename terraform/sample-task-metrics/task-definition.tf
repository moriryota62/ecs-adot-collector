# タスク定義の元ネタ：https://github.com/aws-observability/aws-otel-collector/blob/main/examples/ecs/aws-cloudwatch/ecs-ec2-instance-daemon.json
resource "aws_ecs_task_definition" "this" {
  family                   = "${var.base_name}-${var.service_name}"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.task_exe_role.arn

  container_definitions = jsonencode([
    {
      "logConfiguration": {
        "logDriver": "awslogs",
        "secretOptions": [],
        "options": {
          "awslogs-group": "/ecs/${var.base_name}-${var.service_name}",
          "awslogs-region": "${data.aws_region.current.name}",
          "awslogs-create-group": "True",
          "awslogs-stream-prefix": "${var.service_name}"
        }
      },
      "image": "nginx",
      "name": "nginx"
    },
    {
      "logConfiguration": {
        "logDriver": "awslogs",
        "secretOptions": [],
        "options": {
          "awslogs-group": "/ecs/${var.base_name}-${var.service_name}",
          "awslogs-region": "${data.aws_region.current.name}",
          "awslogs-create-group": "True",
          "awslogs-stream-prefix": "${var.service_name}"
        }
      },
      "command": [
        "--config=/etc/ecs/container-insights/custom-config.yaml"
      ],
      "name": "adot-collector",
      "image": "ryotamori/aws-otel-collector:20221106-1646"
    }
  ])

  tags = {
    "Name" = "${var.base_name}-${var.service_name}"
  }
}