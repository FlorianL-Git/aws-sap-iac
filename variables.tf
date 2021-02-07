variable "aws_region" {
  type        = string
  description = "AWS Region in which the SAP System should be provisioned."
}

variable "sap_sid" {
  type        = string
  description = "SAP System identifier."
}

variable "vpc_id" {
  type        = string
  description = "AWS Private VPC ID"
}

variable "domain_name" {
  type        = string
  description = "The already existing Route53 domain name which should be used for the full qualified hostname resolution."
}

variable "ascs_instance_number" {
  type        = number
  description = "Instance Number of the SAP ASCS instance."
}

variable "ascs_ami" {
  type        = string
  description = "AWS AMI of the SAP ASCS instance."
}

variable "ascs_hostname" {
  type        = string
  description = "Hostname of the SAP ASCS instance."
}

variable "ascs_instance_type" {
  type        = string
  description = "AWS Instance Type of the SAP ASCS instance."
}

variable "appserver_count" {
  type        = number
  description = "Amount of Application Server instances."
}

variable "appserver_start_instance_number" {
  type        = number
  description = "Upcounting Insdtance Number of the Application Server instances."
}

variable "appserver_ami" {
  type        = string
  description = "AWS AMI of the Application Server instances."
}

variable "appserver_hostname_prefix" {
  type        = string
  description = "Upcounting Hostname Prefix of the Application Server instances."
}

variable "appserver_instance_type" {
  type        = string
  description = "AWS Instance Type of the Application Server instances."
}

variable "hdb_instance_number" {
  type        = number
  description = "Instance Number of the HANA Database instance."
}

variable "hdb_ami" {
  type        = string
  description = "AWS AMI of the HANA Database instance."
}

variable "hdb_hostname" {
  type        = string
  description = "Hostname of the HANA Database instance."
}

variable "hdb_instance_type" {
  type        = string
  description = "AWS Instance Type of the HANA Database instance."
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Public Key for the Instance connection."
}