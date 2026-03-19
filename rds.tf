resource "aws_db_instance" "mysql_db" {
  identifier = "data-eng-project-db2"

  engine         = "mysql"
  engine_version = "8.4"
  instance_class = "db.t4g.micro"

  allocated_storage = 20
  storage_type      = "gp2"

  db_name  = "dataengprojectdb2"
  username = var.db_username
  password = var.db_password

  publicly_accessible = true

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]

  parameter_group_name = aws_db_parameter_group.mysql_cdc_pg.name

  skip_final_snapshot = true
}
