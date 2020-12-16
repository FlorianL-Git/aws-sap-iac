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

resource "aws_security_group_rule" "indexserver" {
  type              = "ingress"
  from_port         = "3${var.sap_instance_number}15"
  to_port           = "3${var.sap_instance_number}15"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "Indexserver"
}

resource "aws_security_group_rule" "indexserver_sysdb" {
  type              = "ingress"
  from_port         = "3${var.sap_instance_number}13"
  to_port           = "3${var.sap_instance_number}13"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "Indexserver SystemDB"
}

resource "aws_security_group_rule" "scriptserver" {
  type              = "ingress"
  from_port         = "3${var.sap_instance_number}41"
  to_port           = "3${var.sap_instance_number}41"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "Scriptserver"
}

resource "aws_security_group_rule" "xsa_hostname_routing" {
  type              = "ingress"
  from_port         = "3${var.sap_instance_number}33"
  to_port           = "3${var.sap_instance_number}33"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "XSA Hostname Routing"
}

resource "aws_security_group_rule" "webdispatcher_http" {
  type              = "ingress"
  from_port         = "80${var.sap_instance_number}"
  to_port           = "80${var.sap_instance_number}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SAP Web Dispatcher HTTP"
}

resource "aws_security_group_rule" "webdispatcher_https" {
  type              = "ingress"
  from_port         = "43${var.sap_instance_number}"
  to_port           = "43${var.sap_instance_number}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SAP Web Dispatcher HTTPS"
}

resource "aws_security_group_rule" "instance_agent_http" {
  type              = "ingress"
  from_port         = "5${var.sap_instance_number}13"
  to_port           = "5${var.sap_instance_number}13"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "Instance Agent HTTP"
}

resource "aws_security_group_rule" "instance_agent_https" {
  type              = "ingress"
  from_port         = "5${var.sap_instance_number}14"
  to_port           = "5${var.sap_instance_number}14"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "Instance Agent HTTPS"
}

resource "aws_security_group_rule" "hostagent_http" {
  type              = "ingress"
  from_port         = "1128"
  to_port           = "1128"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SAP Host Agent HTTP"
}

resource "aws_security_group_rule" "hostagent_https" {
  type              = "ingress"
  from_port         = "1129"
  to_port           = "1129"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SAP Host Agent HTTPS"
}

resource "aws_security_group_rule" "sap_support" {
  type              = "ingress"
  from_port         = "3${var.sap_instance_number}09"
  to_port           = "3${var.sap_instance_number}09"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sec_group_instance.id
  description       = "SAP Support"
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