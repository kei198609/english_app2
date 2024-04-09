####################################################
# ユーザ、許可ポリシー
####################################################
resource "aws_iam_user" "prod_user" {
  name = var.prod_user_name
  path = "/"
}

resource "aws_iam_user_policy_attachment" "prod_user_admin_access" {
  user       = var.prod_user_name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_policy_attachment" "prod_user_s3_access" {
  user       = var.prod_user_name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
####################################################
# ecsTaskExecutionRole
####################################################
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "ecsTaskExecutionRole"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        },
        Sid = ""
      },
    ]
  })
  description          = "Allows ECS tasks to call AWS services on your behalf."
  path                 = "/"
  max_session_duration = 3600
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy_attachment" {
  role       = "ecsTaskExecutionRole"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_iam_role_policy_attachment" "ecs_fargate_exec_role_attachment" {
  role       = "ecsTaskExecutionRole"
  policy_arn = "arn:aws:iam::${var.aws_account_id}:policy/ecsFargateExecRole"
}

resource "aws_iam_role_policy_attachment" "ecs_systems_manager_role_attachment" {
  role       = "ecsTaskExecutionRole"
  policy_arn = "arn:aws:iam::${var.aws_account_id}:policy/ecsSystemsManagerRole"
}