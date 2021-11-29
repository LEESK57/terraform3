resource "aws_key_pair" "sdkim_key" {
  key_name   = "sdkim1-key"
  public_key = file("../../.ssh/sdkim-key.pub")
}
