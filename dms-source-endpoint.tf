resource "aws_dms_endpoint" "source_endpoint" {
  endpoint_id   = "db-source-endpoint"
  endpoint_type = "source"
  engine_name   = "mysql"

  server_name   = aws_db_instance.mysql_db.address
  port          = 3306
  username      = var.db_username
  password      = var.db_password
  database_name = "dataengprojectdb2"
}
