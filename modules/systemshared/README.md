![alt text](images/Architecture.svg "Architecture")

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.2 |
| aws | >= 3.21.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.21.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| backup\_schedule\_filesystems | (Cron-Expression) Schedule for the filesystem backups | `string` | `"cron(0 20 * * ? *)"` | no |
| sap\_sid | SAP System identifier | `string` | n/a | yes |
| vpc\_id | Private VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| backup\_plan\_filesystems | n/a |
| iam\_backup\_role\_id | n/a |
| iam\_hanadb\_role\_id | n/a |
| iam\_s4\_role\_id | n/a |
| kms\_key\_arn | n/a |
