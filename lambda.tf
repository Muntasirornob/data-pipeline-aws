resource "aws_lambda_function" "data_generator" {
  function_name = "data-eng-data-gen-2"

  runtime = "python3.12"
  handler = "lambda_function.lambda_handler"

  filename         = "${path.module}/lambda/lambda_function.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/lambda_function.zip")

  role = aws_iam_role.lambda_execution_role.arn

  timeout = 300

  environment {
    variables = {
      SECRET_NAME = aws_secretsmanager_secret.rds_secret.name
      REGION_NAME = "us-east-2"
    }
  }
}
