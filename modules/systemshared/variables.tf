variable "sap_sid" {
    description = "SAP System identifier"
    type        = string
}

variable "vpc_id" {
    description = "Private VPC"
    type        = string
}

variable "backup_schedule_filesystems" {
    description = "(Cron-Expression) Schedule for the filesystem backups"
    type        = string
    default = "cron(0 20 * * ? *)"
}
