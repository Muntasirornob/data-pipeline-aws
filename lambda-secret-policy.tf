resource "aws_iam_policy" "lambda_secret_access" {
  name = "lambda-secret-access-policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "secretsmanager:GetSecretValue"
        ]
        Resource = aws_secretsmanager_secret.rds_secret.arn
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_secret_access_attach" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = aws_iam_policy.lambda_secret_access.arn
}
