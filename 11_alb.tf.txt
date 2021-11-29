resource "aws_lb" "sdkim_alb" {
  name               = "sdkim-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sdkim_sg.id]
  subnets            = [aws_subnet.sdkim_puba.id, aws_subnet.sdkim_pubc.id]
  tags = {
    "Name" = "sdkim-alb"
  }
}

output "dns_name" {
  value = aws_lb.sdkim_alb.dns_name
}
