resource "aws_instance" "sap_instance" {

  ami           = var.ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.ssh.id
  iam_instance_profile  = aws_iam_instance_profile.instance_profile.id
  monitoring    = true

  tags = merge(
    local.common_tags,
    {
      Name                = "${var.sap_sid} - ${var.hostname}"
    }
  )

  root_block_device {
    encrypted   = true
    kms_key_id  = var.kms_key_id
    volume_size =  50
  }

  network_interface {
    network_interface_id = aws_network_interface.eth0.id
    device_index         = 0
  }
  
} 

#Additional tag as root block device tags cannot be set in creation of the instance
resource "aws_ec2_tag" "root_block_name" {
  resource_id = aws_instance.sap_instance.root_block_device.0.volume_id
  key         = "Name"
  value       = "${lower(var.sap_sid)}_${var.hostname}_root"
}

resource "aws_ec2_tag" "root_block_tags" {
  for_each = local.common_tags
  resource_id = aws_instance.instance.root_block_device.0.volume_id
  key         = each.key
  value       = each.value
}

resource "aws_network_interface" "eth0" {
  subnet_id       = var.subnet_id
  security_groups = [ aws_security_group.sec_group_instance.id ]

  tags = merge(
    local.common_tags,
    {
      Name                = "${var.sap_sid} - ${var.hostname}"
    }
  )
}

resource "aws_route53_record" "servername" {
  zone_id = data.aws_route53_zone.dns_zone.zone_id
  name    = var.hostname
  type    = "A"
  ttl     = "300"
  records = [aws_network_interface.eth0.private_ip]
}