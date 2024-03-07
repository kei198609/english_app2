####################################################
# ECS cluster
####################################################
resource "aws_ecs_cluster" "prod_ecs_cluster" {
  name = "myapp-prod-ecs-cluster"

  configuration {
    execute_command_configuration {
      logging = "DEFAULT"
    }
  }

  service_connect_defaults {
    namespace = "arn:aws:servicediscovery:ap-northeast-1:938013391157:namespace/ns-hkanewvjfadpdk3j"
  }

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


####################################################
# ECS task
####################################################
resource "aws_ecs_task_definition" "prod_task_front" {
  family                   = "myapp-prod-task-front"
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::938013391157:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::938013391157:role/ecsTaskExecutionRole"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]

  container_definitions = jsonencode([
    {
      name      = "myapp-prod-container-front"
      image     = "938013391157.dkr.ecr.ap-northeast-1.amazonaws.com/myapp-prod-front:latest"
      cpu       = 0
      memory    = 0
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
          protocol      = "tcp"
        },
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-create-group"  = "true"
          "awslogs-group"         = "/ecs/myapp-prod-task-front"
          "awslogs-region"        = "ap-northeast-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
      environment = [
        {
          name  = "NODE_ENV"
          value = "production"
        },
      ]
    },
  ])

  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
  # lifecycle.ignore_changes に container_definitions を追加することで更新をしない
  lifecycle {
    ignore_changes = [
      container_definitions,
    ]
  }
  tags = {}
}

resource "aws_ecs_task_definition" "prod_task_back" {
  family                   = "myapp-prod-task-back"
  network_mode             = "awsvpc"
  execution_role_arn       = "arn:aws:iam::938013391157:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::938013391157:role/ecsTaskExecutionRole"
  cpu                      = "256"
  memory                   = "512"
  requires_compatibilities = ["FARGATE"]
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }
  container_definitions = jsonencode([
    {
      name      = "myapp-prod-container-back"
      image     = "938013391157.dkr.ecr.ap-northeast-1.amazonaws.com/myapp-prod-back:latest"
      essential = true
      environment = [
        { name = "RAILS_ENV", value = "production" },
        { name = "RAILS_LOG_TO_STDOUT", value = "true" },
        { name = "RAILS_SERVE_STATIC_FILES", value = "true" }
      ]
      secrets = [
        { name = "AWS_ACCESS_KEY_ID", valueFrom = "access-key-id" },
        { name = "AWS_SECRET_ACCESS_KEY", valueFrom = "secret-access-key" },
        { name = "DB_DATABASE", valueFrom = "db-name" },
        { name = "DB_HOST", valueFrom = "db-host" },
        { name = "DB_PASSWORD", valueFrom = "db-password" },
        { name = "DB_USERNAME", valueFrom = "db-username" },
        { name = "RAILS_MASTER_KEY", valueFrom = "rails-master-key" }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-create-group"  = "true"
          "awslogs-group"         = "/ecs/myapp-prod-task-back"
          "awslogs-region"        = "ap-northeast-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
      healthCheck = {
        command     = ["CMD-SHELL", "curl --unix-socket /app/tmp/sockets/puma.sock http://localhost/api/v1/health_check || exit 1"]
        interval    = 30
        retries     = 3
        startPeriod = 15
        timeout     = 5
      }
    },
    {
      name      = "myapp-prod-container-nginx"
      image     = "938013391157.dkr.ecr.ap-northeast-1.amazonaws.com/myapp-prod-nginx:latest"
      essential = true
      portMappings = [
        { containerPort = 80, hostPort = 80, protocol = "tcp" }
      ]
      dependsOn = [
        { containerName = "myapp-prod-container-back", condition = "HEALTHY" }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-create-group"  = "true"
          "awslogs-group"         = "/ecs/myapp-prod-task-back"
          "awslogs-region"        = "ap-northeast-1"
          "awslogs-stream-prefix" = "ecs"
        }
      }
      volumesFrom = [
        { sourceContainer = "myapp-prod-container-back", readOnly = false }
      ]
    }
  ])
  volume {
    name = "rails"
  }
  lifecycle {
    ignore_changes = [
      container_definitions,
    ]
  }
  tags = {}
}

####################################################
# ECS service
####################################################
resource "aws_ecs_service" "prod_service_frontend_alb" {
  name                               = "myapp-prod-service-frontend-alb"
  cluster                            = aws_ecs_cluster.prod_ecs_cluster.id
  task_definition                    = "myapp-prod-task-front:4"
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  desired_count                      = 0
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  health_check_grace_period_seconds  = 0
  enable_ecs_managed_tags            = true
  enable_execute_command             = false
  propagate_tags                     = "NONE"
  platform_version                   = "LATEST"

  deployment_controller {
    type = "ECS"
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.prod-front-sg.id]
    subnets          = [aws_subnet.prod_front_subnet_public_1a.id, aws_subnet.prod_front_subnet_public_1c.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.prod_front_tg.arn
    container_name   = "myapp-prod-container-front"
    container_port   = 3000
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      load_balancer,
    ]
  }

  tags = {}
}

resource "aws_ecs_service" "prod_service_rails_alb" {
  name                               = "myapp-prod-service-rails-alb"
  cluster                            = aws_ecs_cluster.prod_ecs_cluster.id
  task_definition                    = "myapp-prod-task-back:28"
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"
  desired_count                      = 0
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  enable_ecs_managed_tags            = true
  enable_execute_command             = true
  health_check_grace_period_seconds  = 0
  platform_version                   = "1.4.0"
  propagate_tags                     = "NONE"

  deployment_controller {
    type = "ECS"
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.prod-back-sg.id]
    subnets          = [aws_subnet.prod_back_subnet_public_1a.id, aws_subnet.prod_back_subnet_public_1c.id]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.prod_back_tg.arn
    container_name   = "myapp-prod-container-nginx"
    container_port   = 80
  }

  lifecycle {
    ignore_changes = [
      task_definition,
      load_balancer,
    ]
  }

  tags = {}
}