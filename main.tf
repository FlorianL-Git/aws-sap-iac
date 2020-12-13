provider "aws" {
  profile = "myprofile"
  region  = "eu-central-1"
}

locals {
    sap_sid = "FHD"
    vpc_id  = "vpc-009cbc51f7bb28df1"
}
/*
module "ascs" {
    source = "./module/ascs"    
    domain_name = "sap-fh.eu-central-1.aws.cloud.bmw"
    sap_sid = locals.sap_sid
    sap_instance_number = "20"
    subnet_id = element(tolist(data.aws_subnet_ids.subnets.ids), 0)
    ami           = "ami-01b462b77531c0987"
    instance_type = "t3.micro"
    hostname      = "tfhdcs20"
    instance_role = module.systemshared.iam_instance_role_id
}*/

module "systemshared" {
    source = "./modules/systemshared"  
    sap_sid = local.sap_sid
    vpc_id =  local.vpc_id
}