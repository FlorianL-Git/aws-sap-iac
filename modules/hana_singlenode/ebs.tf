resource "aws_ebs_volume" "usrsap" {
  availability_zone = aws_instance.instance.availability_zone
  size              = var.usrsap_size
  type              = "gp2"
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name      = "${lower(var.sap_sid)}_${var.hostname}_usrsap"
    }
  )
}

resource "aws_volume_attachment" "ebs_usrsap_att" {
  device_name = "/dev/sdg"
  volume_id   = aws_ebs_volume.usrsap.id
  instance_id = aws_instance.instance.id
}

resource "aws_ebs_volume" "swap" {
  availability_zone = aws_instance.instance.availability_zone
  size              = var.swap_size
  type              = "gp2"
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name = "${lower(var.sap_sid)}_${var.hostname}_swap"
    }
  )
}

resource "aws_volume_attachment" "ebs_swap_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.swap.id
  instance_id = aws_instance.instance.id
}

resource "aws_ebs_volume" "hana_data" {
  count             = var.hana_data_amount != null ? var.hana_data_amount : var.hana_data[var.instance_type][var.hana_data_type].amount
  availability_zone = aws_instance.instance.availability_zone
  size              = var.hana_data_size != null ? var.hana_data_size : var.hana_data[var.instance_type][var.hana_data_type].disk_size
  type              = var.hana_data_type
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name = "${lower(var.sap_sid)}_${var.hostname}_hana_data${count.index+1}"
    }
  )
}

resource "aws_volume_attachment" "ebs_hana_data_att" {
  count = var.hana_data_amount != null ? var.hana_data_amount : var.hana_data[var.instance_type][var.hana_data_type].amount
  device_name = element(var.hana_data_device_names, count.index)
  volume_id   = element(aws_ebs_volume.hana_data.*.id, count.index)
  instance_id = aws_instance.instance.id
}

resource "aws_ebs_volume" "hana_log" {
  count             = var.hana_log_amount != null ? var.hana_log_amount : var.hana_log[var.instance_type][var.hana_log_type].amount
  availability_zone = aws_instance.instance.availability_zone
  size              = var.hana_log_size != null ? var.hana_log_size : var.hana_log[var.instance_type][var.hana_log_type].disk_size
  type              = var.hana_log_type
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name = "${lower(var.sap_sid)}_${var.hostname}_hana_log${count.index+1}"
    }
  )
}

resource "aws_volume_attachment" "ebs_hana_log_att" {
  count = var.hana_log_amount != null ? var.hana_log_amount : var.hana_log[var.instance_type][var.hana_log_type].amount
  device_name = element(var.hana_log_device_names, count.index)
  volume_id   = element(aws_ebs_volume.hana_log.*.id, count.index)
  instance_id = aws_instance.instance.id
}

resource "aws_ebs_volume" "hana_shared" {
  availability_zone = aws_instance.instance.availability_zone
  size              = var.hana_shared_size != null ? var.hana_shared_size : var.hana_shared[var.instance_type]
  type              = "gp2"
  encrypted         = true
  kms_key_id        = var.kms_key_id

  tags = merge(
    local.common_tags,
    {
      Name = "${lower(var.sap_sid)}_${var.hostname}_hana_shared"
    }
  )
}

resource "aws_volume_attachment" "ebs_hana_shared_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.hana_shared.id
  instance_id = aws_instance.instance.id
}