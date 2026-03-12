resource "aws_dms_endpoint" "target_endpoint" {
  endpoint_id   = "db-target-endpoint"
  endpoint_type = "target"
  engine_name   = "s3"

  s3_settings {
    bucket_name             = aws_s3_bucket.data_lake.bucket
    bucket_folder           = "bronze_data"
    service_access_role_arn = aws_iam_role.dms_s3_role.arn
    add_column_name         = true
  }
}
