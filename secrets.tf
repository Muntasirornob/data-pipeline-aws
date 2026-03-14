resource "aws_secretsmanager_secret" "rds_secret" {
  name = "data-eng-project-rds-secret-2"
}

resource "aws_secretsmanager_secret_version" "rds_secret_value" {
  secret_id = aws_secretsmanager_secret.rds_secret.id

  secret_string = jsonencode({
    host     = aws_db_instance.mysql_db.address
    username = var.db_username
    password = var.db_password
    dbname   = "dataengprojectdb2"
  })
}
