locals {
  # Common tags to be assigned to all resources
  common_tags = {
    "sap-sid"   = var.sap_sid
    "terraform-module"  = "systemshared"
  }
}