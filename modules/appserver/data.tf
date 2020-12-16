data "aws_route53_zone" "dns_zone" {
  name         = var.domain_name
  private_zone = true
}

data "aws_subnet" "deploy" {
  id = var.subnet_id
}

data "aws_region" "current" {}