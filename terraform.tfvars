aws_region = "eu-central-1"
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
ssh_public_key  =   "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDjZD5PNfn/LDreoxfMcVEPxu13w9/Wbx/tvI/73NwKum1fIOZTtFmzsESsJ9JPP9xOCxjpRy5PSQwU/lmRsEOkPgSAORdTaggcdlgEI8o4JP+K+IZubaHb8VZDqyjy9Ul9wrmVC83jgMcUlg6zH3bAIlltX6KS0rDLCNa9IVBS5Ms9XYtzp60aqiHPVGrMvyjxxTIMdvjAET3F8EEpnnYyzTrOZVms5mE0EkusscLCG+HP3GeIJVC7c0KEMKEHH/a4usXIp+0WpInfZzb2Nu9I60VMkLa9v/VnqB2UBLDSXTcliiwMkg2jXtDfR9dqN4DCpR0LqY7ztMHuJGvJuuyf"