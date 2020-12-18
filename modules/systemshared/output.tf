output "backup_plan_filesystems" {
  value = aws_backup_plan.filesystems.id
}

output "iam_backup_role" {
  value = aws_iam_role.backup.arn
}

output "iam_s4_role" {
  value = aws_iam_role.s4_role.name
}

output "iam_hanadb_role" {
  value = aws_iam_role.hanadb_role.name
}

output "kms_key" {
  value = aws_kms_key.system.arn
}
