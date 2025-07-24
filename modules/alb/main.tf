resource "aws_lb" "ecoshop_alb" {
  name               = "ecoshop-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_web_id]
  subnets            = var.web_subnet_ids

  tags = { Name = "EcoShop ALB" }
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-targets"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/index.php"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = { Name = "App Target Group" }
}

resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.ecoshop_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "app_targets" {
  count               = length(var.target_instance_ids)
  target_group_arn    = aws_lb_target_group.app_tg.arn
  target_id           = var.target_instance_ids[count.index]
  port                = 80
}