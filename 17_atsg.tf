resource "aws_placement_group" "sdkim_pg" {
  name     = "sdkim-pg"
  strategy = "cluster"
}

resource "aws_autoscaling_group" "sdkim_atsg" {
  name                      = "sdkim-atsg"
  min_size                  = 2
  max_size                  = 8
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 2
  force_delete              = true
  launch_configuration      = aws_launch_configuration.sdkim_lacf.id
  placement_group           = aws_placement_group.sdkim_pg.id
  vpc_zone_identifier       = [aws_subnet.sdkim_puba.id, aws_subnet.sdkim_pubc.id]
}
