####################################################
# ALB
####################################################
resource "aws_lb" "prod_front_alb" {
  name                              = "myapp-prod-front-alb"
  load_balancer_type                = "application"
  enable_deletion_protection        = false
  enable_cross_zone_load_balancing  = true
  enable_http2                      = true
  subnets                           = [aws_subnet.prod_front_subnet_public_1a.id, aws_subnet.prod_front_subnet_public_1c.id]
  security_groups                   = [aws_security_group.prod-front-sg.id]
  idle_timeout                      = 60
  internal                          = false
  desync_mitigation_mode            = "defensive"
  ip_address_type                   = "ipv4"
}
resource "aws_lb" "prod_back_alb" {
  name                              = "myapp-prod-back-alb"
  load_balancer_type                = "application"
  enable_deletion_protection        = false
  enable_cross_zone_load_balancing  = true
  enable_http2                      = true
  subnets                           = [aws_subnet.prod_back_subnet_public_1a.id, aws_subnet.prod_back_subnet_public_1c.id]
  security_groups                   = [aws_security_group.prod-back-sg.id]
  idle_timeout                      = 60
  internal                          = false
  desync_mitigation_mode            = "defensive"
  ip_address_type                   = "ipv4"
}

####################################################
# ALB listener
####################################################
# FRONT
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.prod_front_alb.id
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate.front_domain_acm.arn

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-northeast-1:938013391157:targetgroup/myapp-prod-front-tg/44099df484c757a0"
        weight = 1
      }

      stickiness {
        enabled  = false
        duration = 3600
      }
    }
  }
}
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.prod_front_alb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-northeast-1:938013391157:targetgroup/myapp-prod-front-tg/44099df484c757a0"
        weight = 1
      }
    }
  }
}
# BACKEND
resource "aws_lb_listener" "https_back" {
  load_balancer_arn = aws_lb.prod_back_alb.id
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = aws_acm_certificate.api_domain_acm.arn

  default_action {
    type             = "forward"

    forward {
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-northeast-1:938013391157:targetgroup/myapp-prod-back-tg/824ba23ff7bd95d6"
        weight = 1
      }

      stickiness {
        enabled  = false
        duration = 3600
      }
    }
  }
}

resource "aws_lb_listener" "http_back" {
  load_balancer_arn = aws_lb.prod_back_alb.id
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-northeast-1:938013391157:targetgroup/myapp-prod-back-tg/824ba23ff7bd95d6"
        weight = 1
      }
    }
  }
}
####################################################
# ALB targetgroup
####################################################
resource "aws_lb_target_group" "prod_front_tg" {
  name                              = "myapp-prod-front-tg"
  port                              = 80
  protocol                          = "HTTP"
  vpc_id                            = aws_vpc.prod_vpc.id
  target_type                       = "ip"
  deregistration_delay              = 300
  load_balancing_algorithm_type     = "round_robin"
  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
    timeout             = 5
  }
  stickiness {
    enabled         = false
    type            = "lb_cookie"
    cookie_duration = 86400
  }
}
resource "aws_lb_target_group" "prod_back_tg" {
  name                              = "myapp-prod-back-tg"
  port                              = 80
  protocol                          = "HTTP"
  vpc_id                            = aws_vpc.prod_vpc.id
  target_type                       = "ip"
  deregistration_delay              = 300
  load_balancing_algorithm_type     = "round_robin"
  health_check {
    enabled             = true
    interval            = 30
    path                = "/api/v1/health_check"
    port                = "traffic-port"
    protocol            = "HTTP"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
    timeout             = 5
  }
  stickiness {
    enabled         = false
    type            = "lb_cookie"
    cookie_duration = 86400
  }
}