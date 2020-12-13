resource "aws_efs_file_system" "sapmnt" {
  creation_token = "sapmnt_${var.sap_sid}"
  performance_mode = "generalPurpose"
  throughput_mode = "bursting"
  encrypted = "true"
  kms_key_id = aws_kms_key.system.arn

  tags = merge(
    local.common_tags,
    {
      Name = "sapmnt_${var.sap_sid}"
    }
  )
}

resource "aws_efs_mount_target" "mount_sapmnt" {
   for_each      = data.aws_subnet_ids.subnets.ids
   file_system_id  = aws_efs_file_system.sapmnt.id
   subnet_id = each.value
   security_groups = [aws_security_group.sec_group_efs.id]
 }

