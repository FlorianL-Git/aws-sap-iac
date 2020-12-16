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
  description = "Instance Number of the App Server."
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
  default     = 15
}

variable "swap_size" {
  type        = number
  description = "Size of the swap filesystem."
  default        = 32
}

variable "hana_data_size" {
  type        = number
  description = "Size of the /hana/data filesystem."
  default        = null
}

variable "hana_data_amount" {
  type        = number
  description = "Amount of stripes for the /hana/data filesystem."
  default        = null
}

variable "hana_data_type" {
  type        = string
  description = "Type of the /hana/data filesystem. Either gp2 or io1 currently."
  default        = "gp2"
}

variable "hana_log_size" {
  type        = number
  description = "Size of the /hana/data filesystem."
  default        = null
}

variable "hana_log_amount" {
  type        = number
  description = "Amount of stripes for the /hana/log filesystem."
  default        = null
}

variable "hana_log_type" {
  type        = string
  description = "Type of the /hana/log filesystem. Either gp2 or io1 currently."
  default        = "gp2"
}

variable "hana_shared_size" {
  type        = number
  description = "Size of the /hana/data filesystem."
  default        = null
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
  default     = null
}

variable "backup_role" {
  type        = string
  description = "IAM Role for AWS Backup."
  default     = null
}