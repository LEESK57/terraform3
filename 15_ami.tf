resource "aws_ami_from_instance" "sdkim-ami" {
  name               = "sdkim-ami"
  source_instance_id = aws_instance.sdkim_web.id
  depends_on = [
    aws_instance.sdkim_web
  ]

}
