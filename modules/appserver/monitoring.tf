resource "aws_cloudwatch_metric_alarm" "ec2_auto_recovery" {
  alarm_name          = "${var.sap_sid}-${var.hostname}-EC2AutoRecovery"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Minimum"

  dimensions = {
    InstanceId = aws_instance.sap_instance.id
  }

  alarm_actions = compact(["arn:aws:automate:${data.aws_region.current.name}:ec2:recover"])
  threshold         = "1"
  alarm_description = "Auto recover the EC2 instance if Status Check fails."
  tags = merge(
    local.common_tags,
    {
      Name                = "EC2 Auto Recovery for ${var.sap_sid} ${var.hostname}"
    }
  )
}
