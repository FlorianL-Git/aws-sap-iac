variable "domain_name" {
  type        = string
  description = "The domain name which should be used for the full qualified hostname resolution."
}

variable "subnet_id" {
    description = "Subnet ID to deploy the EC2 Instance."
    type        = string
}

variable "sap_sid" {
  type        = string
  description = "SAP System identifier."
}

variable "sap_instance_number" {
  type        = number
  description = "Instance Number of the SAP instance."
}

#Instance Variables
variable "hostname" {
    description = "Hostname of the provided instance."
    type        = string
}

variable "ami" {
    description = "AWS AMI."
    type        = string
}

variable "instance_type" {
    description = "AWS Instance Type."
    type        = string
}

variable "ssh_public_key" {
  type        = string
  description = "SSH Key for the EC2-Instance."
}

#EBS Config Variables
variable "usrsap_size" {
  type        = number
  description = "Size of the /usr/sap filesystem."
  default     = 50
}

variable "swap_size" {
  type        = number
  description = "Size of the swap filesystem."
  default        = 32
}

#Security Setting
variable "instance_role" {
  type        = string
  description = "Role for the EC2 IAM Instance Profile."
  default     = null
}

variable "kms_key_id" {
  type        = string
  description = "KMS Key for encryption."
  default     = null
}

#Backup Setting
variable "filesystem_backup_plan" {
  type        = string
  description = "Role for the EC2 IAM Instance Profile."
}

variable "backup_role" {
  type        = string
  description = "IAM Role for AWS Backup."
}