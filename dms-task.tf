resource "aws_dms_replication_task" "migration_task" {
  replication_task_id      = "db-migration-task"
  migration_type           = "cdc"
  replication_instance_arn = aws_dms_replication_instance.replication_instance.replication_instance_arn

  source_endpoint_arn = aws_dms_endpoint.source_endpoint.endpoint_arn
  target_endpoint_arn = aws_dms_endpoint.target_endpoint.endpoint_arn

  replication_task_settings = jsonencode({
    TargetMetadata = {
      TargetSchema           = ""
      SupportLobs            = true
      FullLobMode            = false
      LobChunkSize           = 0
      LimitedSizeLobMode     = true
      LobMaxSize             = 32
      InlineLobMaxSize       = 0
      LoadMaxFileSize        = 0
      ParallelLoadThreads    = 0
      ParallelLoadBufferSize = 0
      BatchApplyEnabled      = false
    }
    FullLoadSettings = {
      TargetTablePrepMode = "DROP_AND_CREATE"
    }
    Logging = {
      EnableLogging = true
    }
  })

  table_mappings = jsonencode({
    rules = [
      {
        "rule-type" : "selection",
        "rule-id" : "1",
        "rule-name" : "1",
        "object-locator" : {
          "schema-name" : "%",
          "table-name" : "%"
        },
        "rule-action" : "include"
      }
    ]
  })
}
