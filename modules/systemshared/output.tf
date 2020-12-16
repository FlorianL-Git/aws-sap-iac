output "backup_plan_filesystems" {
  value = aws_backup_plan.filesystems.id
}

output "iam_backup_role_id" {
  value = aws_iam_role.backup.id
}

output "iam_s4_role_id" {
  value = aws_iam_role.s4_role.id
}

output "iam_hanadb_role_id" {
  value = aws_iam_role.hanadb_role.id
}

output "kms_key_arn" {
  value = aws_kms_key.system.arn
}
