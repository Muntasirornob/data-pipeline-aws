resource "aws_db_parameter_group" "mysql_cdc_pg" {
  name        = "data-eng-project-db-pg2"
  family      = "mysql8.4"
  description = "parameter group for mysql cdc config"

  parameter {
    name  = "binlog_format"
    value = "ROW"
  }

  parameter {
    name  = "authentication_policy"
    value = "*:mysql_native_password"
  }
}
