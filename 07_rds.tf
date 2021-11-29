resource "aws_db_instance" "sdkim_mydb" {
  allocated_storage      = var.all_size
  storage_type           = var.stor_type
  engine                 = var.mysql
  engine_version         = var.sql_ver
  instance_class         = var.ins_dbtype
  name                   = var.db_name
  identifier             = var.db_name
  username               = var.db_id
  password               = var.db_pass
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "${var.region}${var.ava_zone[0]}"
  db_subnet_group_name   = aws_db_subnet_group.sdkim_dbsg.id
  vpc_security_group_ids = [aws_security_group.sdkim_sg.id]
  skip_final_snapshot    = true
  tags = {
    "Name" = "${var.name}-db"
  }
}
resource "aws_db_subnet_group" "sdkim_dbsg" {
  name       = "${var.name}_dbsg"
  subnet_ids = [aws_subnet.sdkim_pridb[0].id, aws_subnet.sdkim_pridb[1].id]
}
