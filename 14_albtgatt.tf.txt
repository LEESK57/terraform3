resource "aws_lb_target_group_attachment" "sdkim_albtgatt" {
  target_group_arn = aws_lb_target_group.sdkim-albtg.arn
  target_id        = aws_instance.sdkim_web.id
  port             = 80
}
