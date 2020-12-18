resource "aws_backup_vault" "system" {
  name        = "${lower(var.sap_sid)}_backup_vault"
  kms_key_arn = aws_kms_key.system.arn

  tags = merge(
    local.common_tags,
    {
      Name = "${lower(var.sap_sid)}_backup_vault"
    }
  )
}

resource "aws_backup_plan" "filesystems" {
  name = "${lower(var.sap_sid)}_backup_filesystems"

  rule {
    rule_name         = "${lower(var.sap_sid)}_backup_filesystems_rule"
    target_vault_name = aws_backup_vault.system.name
    schedule          = var.backup_schedule_filesystems

    recovery_point_tags = merge(
      local.common_tags,
      {
        type  = "filesystem"
      }
    )
    lifecycle {
      delete_after  = 90
    }
  }
}

resource "aws_s3_bucket" "hana_backint" {
  bucket = "${lower(var.sap_sid)}-hana-backint"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.system.arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  tags = merge(
    local.common_tags,
    {
      Name        = "${lower(var.sap_sid)}_hana_backint"
    }
  )
}

resource "aws_backup_selection" "efs" {
  iam_role_arn = aws_iam_role.backup.arn
  name         = "${var.sap_sid}_efs_backup"
  plan_id      = aws_backup_plan.filesystems.id

  resources = [ aws_efs_file_system.system.arn ]
}