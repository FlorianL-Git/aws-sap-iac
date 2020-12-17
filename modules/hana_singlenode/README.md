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
| ami | AWS AMI. | `string` | n/a | yes |
| backup\_role | IAM Role for AWS Backup. | `string` | n/a | yes |
| domain\_name | The domain name which should be used for the full qualified hostname resolution. | `string` | n/a | yes |
| filesystem\_backup\_plan | Role for the EC2 IAM Instance Profile. | `string` | n/a | yes |
| hana\_data\_amount | Amount of stripes for the /hana/data filesystem. | `number` | `null` | no |
| hana\_data\_size | Size of the /hana/data filesystem. | `number` | `null` | no |
| hana\_data\_type | Type of the /hana/data filesystem. Either gp2 or io1 currently. | `string` | `"gp2"` | no |
| hana\_log\_amount | Amount of stripes for the /hana/log filesystem. | `number` | `null` | no |
| hana\_log\_size | Size of the /hana/data filesystem. | `number` | `null` | no |
| hana\_log\_type | Type of the /hana/log filesystem. Either gp2 or io1 currently. | `string` | `"gp2"` | no |
| hana\_shared\_size | Size of the /hana/data filesystem. | `number` | `null` | no |
| hostname | Hostname of the provided instance. | `string` | n/a | yes |
| instance\_role | Role for the EC2 IAM Instance Profile. | `string` | `null` | no |
| instance\_type | AWS Instance Type. | `string` | n/a | yes |
| kms\_key\_id | KMS Key for encryption. | `string` | `null` | no |
| sap\_instance\_number | Instance Number of the App Server. | `number` | n/a | yes |
| sap\_sid | SAP System identifier. | `string` | n/a | yes |
| ssh\_public\_key | SSH Key for the EC2-Instance. | `string` | n/a | yes |
| subnet\_id | Subnet ID to deploy the EC2 Instance. | `string` | n/a | yes |
| swap\_size | Size of the swap filesystem. | `number` | `32` | no |
| usrsap\_size | Size of the /usr/sap filesystem. | `number` | `15` | no |

## Outputs

No output.
