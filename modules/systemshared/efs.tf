resource "aws_efs_file_system" "system" {
  creation_token = "system_${var.sap_sid}"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  encrypted = "true"
  kms_key_id = aws_kms_key.system.arn

  tags = merge(
    local.common_tags,
    {
      Name = "system_${var.sap_sid}"
    }
  )
}

resource "aws_efs_mount_target" "mount_system" {
   for_each      = data.aws_subnet_ids.subnets.ids
   file_system_id  = aws_efs_file_system.system.id
   subnet_id = each.value
   security_groups = [aws_security_group.sec_group_efs.id]
 }

resource "aws_efs_access_point" "sapmnt" {
  file_system_id = aws_efs_file_system.system.id
  root_directory {
    path = "/sapmnt/${var.sap_sid}"
  }
  tags = merge(
    local.common_tags,
    {
      Name = "sapmnt_${var.sap_sid}"
    }
  )
}

resource "aws_efs_access_point" "transport" {
  file_system_id = aws_efs_file_system.system.id
  root_directory {
    path = "/usr/sap/trans"
  }
  tags = merge(
    local.common_tags,
    {
      Name = "transport_${var.sap_sid}"
    }
  )
}
