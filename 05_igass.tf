resource "aws_route_table_association" "sdkim_igas_puba" {
  subnet_id      = aws_subnet.sdkim_puba.id
  route_table_id = aws_route_table.sdkim_rt.id
}

resource "aws_route_table_association" "sdkim_igas_pubc" {
  subnet_id      = aws_subnet.sdkim_pubc.id
  route_table_id = aws_route_table.sdkim_rt.id
}