provider "aws" {
  profile = "myprofile"
  region  = "eu-central-1"
}

locals {
    sap_sid = "FHC"
    vpc_id  = "vpc-009cbc51f7bb28df1"
    domain_name = "sap-fh.eu-central-1.aws.cloud.bmw"
}

data "aws_subnet_ids" "subnets" {
    vpc_id = local.vpc_id
}

/*
module "ascs" {
    source = "./modules/ascs"    
    domain_name = "sap-fh.eu-central-1.aws.cloud.bmw"
    sap_sid = local.sap_sid
    sap_instance_number = "20"
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 0)
    ami           = "ami-01b462b77531c0987"
    instance_type = "t3.micro"
    hostname      = "tfhdcs20"
    ssh_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjZD5PNfn/LDreoxfMcVEPxu13w9/Wbx/tvI/73NwKum1fIOZTtFmzsESsJ9JPP9xOCxjpRy5PSQwU/lmRsEOkPgSAORdTaggcdlgEI8o4JP+K+IZubaHb8VZDqyjy9Ul9wrmVC83jgMcUlg6zH3bAIlltX6KS0rDLCNa9IVBS5Ms9XYtzp60aqiHPVGrMvyjxxTIMdvjAET3F8EEpnnYyzTrOZVms5mE0EkusscLCG+HP3GeIJVC7c0KEMKEHH/a4usXIp+0WpInfZzb2Nu9I60VMkLa9v/VnqB2UBLDSXTcliiwMkg2jXtDfR9dqN4DCpR0LqY7ztMHuJGvJuuyf florian@DESKTOP-2BBPJ6Q"
    #instance_role = module.systemshared.iam_instance_role_id
}*/

module "hdb" {
    source = "./modules/hana_singlenode"    
    domain_name = local.domain_name
    sap_sid = local.sap_sid
    sap_instance_number = "20"
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 0)
    ami           = "ami-01b462b77531c0987"
    instance_type = "r5.8xlarge"
    hostname      = "tfhdhdb01"
    ssh_public_key       = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjZD5PNfn/LDreoxfMcVEPxu13w9/Wbx/tvI/73NwKum1fIOZTtFmzsESsJ9JPP9xOCxjpRy5PSQwU/lmRsEOkPgSAORdTaggcdlgEI8o4JP+K+IZubaHb8VZDqyjy9Ul9wrmVC83jgMcUlg6zH3bAIlltX6KS0rDLCNa9IVBS5Ms9XYtzp60aqiHPVGrMvyjxxTIMdvjAET3F8EEpnnYyzTrOZVms5mE0EkusscLCG+HP3GeIJVC7c0KEMKEHH/a4usXIp+0WpInfZzb2Nu9I60VMkLa9v/VnqB2UBLDSXTcliiwMkg2jXtDfR9dqN4DCpR0LqY7ztMHuJGvJuuyf florian@DESKTOP-2BBPJ6Q"
    
    #instance_role = module.systemshared.iam_instance_role_id
}

/*
module "systemshared" {
    source = "./modules/systemshared"  
    sap_sid = local.sap_sid
    vpc_id =  local.vpc_id
}
*/