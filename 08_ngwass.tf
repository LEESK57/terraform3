resource "aws_route_table_association" "sdkim_ngwass_pria" {
  subnet_id      = aws_subnet.sdkim_pria.id
  route_table_id = aws_route_table.sdkim_ngwrt.id
}

resource "aws_route_table_association" "sdkim_ngwass_pric" {
  subnet_id      = aws_subnet.sdkim_pric.id
  route_table_id = aws_route_table.sdkim_ngwrt.id
}

resource "aws_route_table_association" "sdkim_ngwass_pridba" {
  subnet_id      = aws_subnet.sdkim_pridba.id
  route_table_id = aws_route_table.sdkim_ngwrt.id
}

resource "aws_route_table_association" "sdkim_ngwass_pridbc" {
  subnet_id      = aws_subnet.sdkim_pridbc.id
  route_table_id = aws_route_table.sdkim_ngwrt.id
}
