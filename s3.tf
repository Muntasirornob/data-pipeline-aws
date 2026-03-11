resource "aws_s3_bucket" "data_lake" {
  bucket = "db-engineering-project-9426-7946-4520-2"
}

locals {
  folders = [
    "bronze_data/Orders/",
    "bronze_data/Customer/",
    "bronze_data/Product/",
    "bronze_data/orderDetails/",
    "silver_data/Orders/",
    "silver_data/Customer/",
    "silver_data/Product/",
    "silver_data/orderDetails/"
  ]
}

resource "aws_s3_object" "folders" {
  for_each = toset(local.folders)

  bucket = aws_s3_bucket.data_lake.id
  key    = each.value
}
