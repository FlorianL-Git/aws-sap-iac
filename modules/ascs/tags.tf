locals {
  # Common tags to be assigned to all resources
  common_tags = {
    "hostname"  = var.hostname
    "domain_name" = var.domain_name
    "fqdn"      = join(".",[var.hostname, var.domain_name])
    "sap-sid"   = var.sap_sid
    "sap-instance-type" = "ascs"
    "sap-instance-number" = var.sap_instance_number
    "terraform-module"  = "systemshared"
  }
}