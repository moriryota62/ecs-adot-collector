# タスク定義の元ネタ：https://github.com/aws-observability/aws-otel-collector/blob/main/examples/ecs/aws-cloudwatch/ecs-ec2-instance-daemon.json
resource "aws_ecs_task_definition" "this" {
  family                   = "${var.base_name}-${var.service_name}"
  requires_compatibilities = ["EC2"]
  network_mode             = "bridge"
  cpu                      = 128
  memory                   = 64
  execution_role_arn       = aws_iam_role.task_exe_role.arn

  container_definitions = jsonencode([
    {
      "logConfiguration" : {
        "logDriver" : "awslogs",
        "secretOptions" : [],
        "options" : {
          "awslogs-group" : "/ecs/${var.base_name}-${var.service_name}",
          "awslogs-region" : "${data.aws_region.current.name}",
          "awslogs-create-group" : "True",
          "awslogs-stream-prefix" : "${var.service_name}"
        }
      },
      "command" : [
        "--config=/etc/ecs/otel-instance-metrics-config.yaml"
      ],
      "cpu" : 0,
      "environment" : [
        {
          "name" : "USE_DEFAULT_CONFIG",
          "value" : "True"
        }
      ],
      "mountPoints" : [
        {
          "readOnly" : true,
          "containerPath" : "/rootfs/proc",
          "sourceVolume" : "proc"
        },
        {
          "readOnly" : true,
          "containerPath" : "/rootfs/dev",
          "sourceVolume" : "dev"
        },
        {
          "readOnly" : true,
          "containerPath" : "/sys/fs/cgroup",
          "sourceVolume" : "al2_cgroup"
        },
        {
          "readOnly" : true,
          "containerPath" : "/cgroup",
          "sourceVolume" : "al1_cgroup"
        },
        {
          "readOnly" : true,
          "containerPath" : "/rootfs/sys/fs/cgroup",
          "sourceVolume" : "al2_cgroup"
        },
        {
          "readOnly" : true,
          "containerPath" : "/rootfs/cgroup",
          "sourceVolume" : "al1_cgroup"
        }
      ],
      "image" : "amazon/aws-otel-collector",
      "essential" : true,
      "name" : "aws-collector"
    }
  ])

  volume {
    name      = "proc"
    host_path = "/proc"
  }

  volume {
    name      = "dev"
    host_path = "/dev"
  }

  volume {
    name      = "al1_cgroup"
    host_path = "/cgroup"
  }

  volume {
    name      = "al2_cgroup"
    host_path = "/sys/fs/cgroup"
  }

  tags = {
    "Name" = "${var.base_name}-${var.service_name}"
  }
}