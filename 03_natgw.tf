resource "aws_eip" "sdkim_ngw_ip" {
  vpc = true
}

resource "aws_nat_gateway" "sdkim_ngw" {
  allocation_id = aws_eip.sdkim_ngw_ip.id
  subnet_id     = aws_subnet.sdkim_pub[0].id
  tags = {
    "Name" = "${var.name}-ngw"
  }
}

resource "aws_route_table" "sdkim_ngwrt" {
  vpc_id = aws_vpc.sdkim_vpc.id

  route {
    cidr_block = var.cidr_route
    gateway_id = aws_nat_gateway.sdkim_ngw.id
  }
  tags = {
    "Name" = "${var.name}-ngwrt"
  }
}

resource "aws_route_table_association" "sdkim_ngwass_pria" {
  count          = length(var.pri_sub)
  subnet_id      = aws_subnet.sdkim_pri[count.index].id
  route_table_id = aws_route_table.sdkim_ngwrt.id
}

resource "aws_route_table_association" "sdkim_ngwass_pridba" {
  count          = length(var.pri_subdb)
  subnet_id      = aws_subnet.sdkim_pridb[count.index].id
  route_table_id = aws_route_table.sdkim_ngwrt.id
}
