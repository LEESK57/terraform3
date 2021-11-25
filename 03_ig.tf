resource "aws_internet_gateway" "sdkim_ig" {
  vpc_id = aws_vpc.sdkim_vpc.id

  tags = {
    "Name" = "sdkim-ig"
  }
}
