resource "aws_kms_key" "system" {
  description             = "${var.sap_sid}_KMS_Key"
}

resource "aws_security_group" "sec_group_efs" {
  #No Name because name prevents the creation before destruction instead use name_prefix
  name_prefix = "${lower(var.sap_sid)}-efs-"
  description = "security group for ${var.sap_sid} EFS storage"
  vpc_id      = var.vpc_id

  tags = {
    Name    = "security group for ${var.sap_sid} EFS storage"
    sap_sid = var.sap_sid
  }

  #Needed because on changes terraform tries to delete the sg befor changing the EC2 instance which doesn'work because there are dependant objects
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "nfs" {
  type              = "ingress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_efs.id
  description       = "NFS"
}