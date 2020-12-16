resource "aws_security_group" "sec_group_instance" {
  #No Name because name prevents the creation before destruction instead use name_prefix
  name_prefix = "${var.sap_sid}-${var.hostname}-"
  description = "Security group for ${var.sap_sid} ${var.hostname}"
  vpc_id      = data.aws_subnet.deploy.vpc_id

  tags = merge(
    local.common_tags,
    {
      Name                = "security group for ${var.sap_sid} ${var.hostname}"
    }
  )

  #Needed because on changes terraform tries to delete the sg befor changing the EC2 instance which doesn'work because there are dependant objects
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SSH"
}

resource "aws_security_group_rule" "sapcontrol_http" {
  type              = "ingress"
  from_port         = "5${var.sap_instance_number}13"
  to_port           = "5${var.sap_instance_number}13"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "sapcontrol HTTP port"
}

resource "aws_security_group_rule" "sapcontrol_https" {
  type              = "ingress"
  from_port         = "5${var.sap_instance_number}14"
  to_port           = "5${var.sap_instance_number}14"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "sapcontrol HTTPS port"
}

resource "aws_security_group_rule" "swpm" {
  type              = "ingress"
  from_port         = 4237
  to_port           = 4237
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SWPM"
}

resource "aws_security_group_rule" "message_server" {
  type              = "ingress"
  from_port         = "36${var.sap_instance_number}"
  to_port           = "36${var.sap_instance_number}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "Message Server"
}

resource "aws_security_group_rule" "dispatcher" {
  type              = "ingress"
  from_port         = "32${var.sap_instance_number}"
  to_port           = "32${var.sap_instance_number}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SAP Dispatcher"
}

resource "aws_security_group_rule" "icm_https" {
  type              = "ingress"
  from_port         = 8443
  to_port           = 8443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "ICM HTTPS"
}

resource "aws_security_group_rule" "icm_http" {
  type              = "ingress"
  from_port         = "80${var.sap_instance_number}"
  to_port           = "80${var.sap_instance_number}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "ICM HTTP"
}

resource "aws_security_group_rule" "icm_smtp" {
  type              = "ingress"
  from_port         = 25
  to_port           = 25
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "ICM SMTP"
}

resource "aws_security_group_rule" "allow_out" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
}

resource "aws_key_pair" "ssh" {
  key_name   = "${var.hostname} - SSH Key"
  public_key = var.ssh_public_key

  tags = merge(
    local.common_tags,
    {
      Name                = "${var.hostname} - SSH Key"
    }
  )
}