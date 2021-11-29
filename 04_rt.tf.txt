resource "aws_route_table" "sdkim_rt" {
  vpc_id = aws_vpc.sdkim_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sdkim_ig.id
  }
  tags = {
    "Name" = "sdkim-rt"
  }
}
