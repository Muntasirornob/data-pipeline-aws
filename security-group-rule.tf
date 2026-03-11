resource "aws_security_group" "rds_sg" {
  name        = "data-eng-project-sg2"
  description = "Security group for RDS MySQL access"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "MySQL public access"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "data-eng-project-sg2"
  }
}
