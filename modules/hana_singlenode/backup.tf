resource "aws_backup_selection" "complete" {
  count = var.backup_role != null && var.filesystem_backup_plan != null ? 1 : 0
  iam_role_arn = var.backup_role
  name         = "${var.hostname}_backup_selection"
  plan_id      = var.filesystem_backup_plan

  resources = [ aws_ebs_volume.usrsap.id, aws_ebs_volume.hana_shared.id ]
}