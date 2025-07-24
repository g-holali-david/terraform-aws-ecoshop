# This module provisions an Internet-facing Application Load Balancer
# with a target group and a listener for HTTP traffic on port 80.

# Create the Application Load Balancer
resource "aws_lb" "this" {
  name               = "ecoshop-alb"
  load_balancer_type = "application"
  internal           = false
  security_groups    = [var.sg_web_id]
  subnets            = var.public_subnet_ids

  tags = {
    Name = "ecoshop-alb"
  }
}

# Create the target group for the app servers
resource "aws_lb_target_group" "this" {
  name     = "ecoshop-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/index.php"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = {
    Name = "ecoshop-tg"
  }
}

# Listener for HTTP on port 80
resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}
