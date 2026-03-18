resource "aws_glue_crawler" "products_crawler" {
  name          = "data-eng-project-products-crawler"
  role          = aws_iam_role.glue_role.arn
  database_name = aws_glue_catalog_database.glue_db.name

  s3_target {
    path = "s3://${aws_s3_bucket.data_lake.bucket}/bronze_data/Product/"
  }

  schema_change_policy {
    update_behavior = "UPDATE_IN_DATABASE"
    delete_behavior = "LOG"
  }
}
