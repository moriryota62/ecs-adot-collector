# Task用のIAM
data "aws_iam_policy_document" "task_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "task_role" {
  name               = "${var.base_name}-${var.service_name}-task-role"
  assume_role_policy = data.aws_iam_policy_document.task_role.json

  tags = {
    "Name" = "${var.base_name}-${var.service_name}-task-role"
  }
}

# Task実行用のIAM
data "aws_iam_policy_document" "task_exe_log" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
      "cloudwatch:PutMetricData"
    ]

    resources = [
      "arn:aws:logs:*:*:*"
    ]
  }
}

resource "aws_iam_policy" "task_exe_log" {
  name   = "${var.base_name}-${var.service_name}-EcsTaskLoggingPolicy"
  policy = data.aws_iam_policy_document.task_exe_log.json
}

data "aws_iam_policy_document" "task_exe_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "task_exe_role" {
  name               = "${var.base_name}-${var.service_name}-task-exe-role"
  assume_role_policy = data.aws_iam_policy_document.task_exe_role.json

  tags = {
    "Name" = "${var.base_name}-${var.service_name}-task-exe-role"
  }
}

resource "aws_iam_role_policy_attachment" "task_exe_log" {
  role       = aws_iam_role.task_exe_role.id
  policy_arn = aws_iam_policy.task_exe_log.arn
}

resource "aws_iam_role_policy_attachment" "task_exe_role" {
  role       = aws_iam_role.task_exe_role.id
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}