resource "aws_iam_policy" "s3_access_policy" {
  name = "db-eng-s3-access-policy2"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:PutObjectTagging"
        ]
        Resource = "arn:aws:s3:::db-engineering-project-9426-7946-4520-2/*"
      }
    ]
  })
}
