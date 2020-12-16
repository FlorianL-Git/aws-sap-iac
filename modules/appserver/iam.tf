resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.hostname}_instance_profile"
  role = var.instance_role
}