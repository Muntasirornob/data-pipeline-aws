resource "aws_dms_replication_instance" "replication_instance" {
  replication_instance_id    = "data-eng-project-replication"
  replication_instance_class = "dms.t3.small"
  allocated_storage          = 50
  publicly_accessible        = true

  vpc_security_group_ids = [
    aws_security_group.rds_sg.id
  ]
}
