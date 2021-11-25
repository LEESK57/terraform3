resource "aws_eip" "sdkim_ngw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "sdkim_ngw" {
  allocation_id = aws_eip.sdkim_ngw_ip.id
  subnet_id     = aws_subnet.sdkim_puba.id
  tags = {
    "Name" = "sdkim-ngw"
  }
}
