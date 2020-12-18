locals {
    sap_sid = "FHC"
    vpc_id  = "vpc-009cbc51f7bb28df1"
    domain_name = "sap-fh.eu-central-1.aws.cloud.bmw"
    ascs_instance_number    =   20
    ascs_ami                =   "ami-01b462b77531c0987"
    ascs_hostname           =   "tfhccs20"
    ascs_instance_type      =   "t3.micro"
    appserver_count         =   2
    appserver_start_instance_number    =   30
    appserver_ami                =   "ami-01b462b77531c0987"
    appserver_hostname_prefix           =   "tfhcdi3"
    appserver_instance_type      =   "t3.micro"
    hdb_instance_number     =   20
    hdb_ami                =   "ami-01b462b77531c0987"
    hdb_hostname           =   "tfhchdb20"
    hdb_instance_type      =   "r5.8xlarge"
    ssh_public_key          =   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjZD5PNfn/LDreoxfMcVEPxu13w9/Wbx/tvI/73NwKum1fIOZTtFmzsESsJ9JPP9xOCxjpRy5PSQwU/lmRsEOkPgSAORdTaggcdlgEI8o4JP+K+IZubaHb8VZDqyjy9Ul9wrmVC83jgMcUlg6zH3bAIlltX6KS0rDLCNa9IVBS5Ms9XYtzp60aqiHPVGrMvyjxxTIMdvjAET3F8EEpnnYyzTrOZVms5mE0EkusscLCG+HP3GeIJVC7c0KEMKEHH/a4usXIp+0WpInfZzb2Nu9I60VMkLa9v/VnqB2UBLDSXTcliiwMkg2jXtDfR9dqN4DCpR0LqY7ztMHuJGvJuuyf florian@DESKTOP-2BBPJ6Q"
}

provider "aws" {
  region = "eu-central-1"
}

data "aws_subnet_ids" "subnets" {
    vpc_id = local.vpc_id
}


module "ascs" {
    source = "./modules/ascs"    
    domain_name = local.domain_name
    sap_sid = local.sap_sid
    sap_instance_number = local.ascs_instance_number
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 1)
    ami           = local.ascs_ami
    instance_type = local.ascs_instance_type
    hostname      = local.ascs_hostname
    ssh_public_key       = local.ssh_public_key
    filesystem_backup_plan = module.systemshared.backup_plan_filesystems
    backup_role =   module.systemshared.iam_backup_role
    instance_role = module.systemshared.iam_s4_role
}

module "appserver" {
    count   = local.appserver_count
    source = "./modules/appserver"    
    domain_name = local.domain_name
    sap_sid = local.sap_sid
    sap_instance_number = local.appserver_start_instance_number + count.index
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 1)
    ami           = local.appserver_ami
    instance_type = local.appserver_instance_type
    hostname      = join("",[local.appserver_hostname_prefix, count.index])
    ssh_public_key       = local.ssh_public_key
    filesystem_backup_plan = module.systemshared.backup_plan_filesystems
    backup_role =   module.systemshared.iam_backup_role
    instance_role = module.systemshared.iam_s4_role
}

module "hdb" {
    source = "./modules/hana_singlenode"    
    domain_name = local.domain_name
    sap_sid = local.sap_sid
    sap_instance_number = local.hdb_instance_number
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 1)
    ami           = local.hdb_ami
    instance_type = local.hdb_instance_type
    hostname      = local.hdb_hostname
    ssh_public_key       = local.ssh_public_key
    filesystem_backup_plan = module.systemshared.backup_plan_filesystems
    backup_role =   module.systemshared.iam_backup_role
    instance_role = module.systemshared.iam_hanadb_role
}


module "systemshared" {
    source = "./modules/systemshared"  
    sap_sid = local.sap_sid
    vpc_id =  local.vpc_id
}