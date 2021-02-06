resource "aws_ebs_volume" "usrsap" {
  availability_zone = aws_instance.sap_instance.availability_zone
  size              = var.usrsap_size
  type              = "gp2"
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name      = "${lower(var.sap_sid)}_${var.hostname}_usrsap",
      filesystem  = "usr_sap"
    }
  )
}

resource "aws_volume_attachment" "ebs_usrsap_att" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.usrsap.id
  instance_id = aws_instance.sap_instance.id
}

resource "aws_ebs_volume" "swap" {
  availability_zone = aws_instance.sap_instance.availability_zone
  size              = var.swap_size
  type              = "gp2"
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name = "${lower(var.sap_sid)}_${var.hostname}_swap",
      filesystem  = "swap"
    }
  )
}

resource "aws_volume_attachment" "ebs_swap_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.swap.id
  instance_id = aws_instance.sap_instance.id
}