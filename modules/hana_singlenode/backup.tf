resource "aws_backup_selection" "complete" {
  iam_role_arn = var.backup_role
  name         = "${var.hostname}_backup_selection"
  plan_id      = var.filesystem_backup_plan

  resources = [ aws_ebs_volume.usrsap.arn, aws_ebs_volume.hana_shared.arn ]
}