resource "aws_lb_listener" "sdkim-alblis" {
  load_balancer_arn = aws_lb.sdkim_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.sdkim-albtg.arn
  }
}