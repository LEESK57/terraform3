resource "aws_launch_configuration" "sdkim_lacf" {
  name                 = "sdkim_lacf"
  image_id             = aws_ami_from_instance.sdkim-ami.id
  instance_type        = "t2.micro"
  iam_instance_profile = "admin_role"
  security_groups      = [aws_security_group.sdkim_sg.id]
  key_name             = "sdkim1-key"
  user_data            = <<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF

}
