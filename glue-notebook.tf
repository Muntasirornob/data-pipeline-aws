# Commented out until script is uploaded to S3
# Uncomment when ready to deploy Glue ETL job

# resource "aws_glue_job" "glue_notebook_job" {
#   name     = "data-eng-project-notebook-job"
#   role_arn = aws_iam_role.glue_role.arn
#
#   command {
#     name            = "glueetl"
#     script_location = "s3://${aws_s3_bucket.data_lake.bucket}/scripts/dummy.py"
#     python_version  = "3"
#   }
#
#   glue_version = "4.0"
#
#   execution_property {
#     max_concurrent_runs = 1
#   }
#
#   default_arguments = {
#     "--job-language" = "python"
#   }
# }
