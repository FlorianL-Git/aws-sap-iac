output "ip_address" {
  value = aws_instance.instance.private_ip
}
output "fqdn" {
  value = aws_route53_record.servername.fqdn
}