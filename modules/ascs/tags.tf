locals {
  # Common tags to be assigned to all resources
  common_tags = {
    "hostname"  = var.hostname
    "sap-sid"   = var.sap_sid
    "sap-instance-type" = "ascs"
    "sap-instance-number" = var.sap_instance_number
    "terraform-module"  = "systemshared"
  }
}