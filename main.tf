provider "aws" {
  region = "eu-central-1"
}

data "aws_subnet_ids" "subnets" {
    vpc_id = var.vpc_id
}


module "ascs" {
    source = "./modules/ascs"    
    domain_name = var.domain_name
    sap_sid = var.sap_sid
    sap_instance_number = var.ascs_instance_number
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 1)
    ami           = var.ascs_ami
    instance_type = var.ascs_instance_type
    hostname      = var.ascs_hostname
    ssh_public_key       = var.ssh_public_key
    filesystem_backup_plan = module.systemshared.backup_plan_filesystems
    backup_role =   module.systemshared.iam_backup_role
    instance_role = module.systemshared.iam_s4_role
}

module "appserver" {
    count   = var.appserver_count
    source = "./modules/appserver"    
    domain_name = var.domain_name
    sap_sid = var.sap_sid
    sap_instance_number = var.appserver_start_instance_number + count.index
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 1)
    ami           = var.appserver_ami
    instance_type = var.appserver_instance_type
    hostname      = join("",[var.appserver_hostname_prefix, count.index])
    ssh_public_key       = var.ssh_public_key
    filesystem_backup_plan = module.systemshared.backup_plan_filesystems
    backup_role =   module.systemshared.iam_backup_role
    instance_role = module.systemshared.iam_s4_role
}

module "hdb" {
    source = "./modules/hana_singlenode"    
    domain_name = var.domain_name
    sap_sid = var.sap_sid
    sap_instance_number = var.hdb_instance_number
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 1)
    ami           = var.hdb_ami
    instance_type = var.hdb_instance_type
    hostname      = var.hdb_hostname
    ssh_public_key       = var.ssh_public_key
    filesystem_backup_plan = module.systemshared.backup_plan_filesystems
    backup_role =   module.systemshared.iam_backup_role
    instance_role = module.systemshared.iam_hanadb_role
}


module "systemshared" {
    source = "./modules/systemshared"  
    sap_sid = var.sap_sid
    vpc_id =  var.vpc_id
}