## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.14.6 |
| aws | >= 3.21.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.21.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| appserver\_ami | AWS AMI of the Application Server instances. | `string` | n/a | yes |
| appserver\_count | Amount of Application Server instances. | `number` | n/a | yes |
| appserver\_hostname\_prefix | Upcounting Hostname Prefix of the Application Server instances. | `string` | n/a | yes |
| appserver\_instance\_type | AWS Instance Type of the Application Server instances. | `string` | n/a | yes |
| appserver\_start\_instance\_number | Upcounting Insdtance Number of the Application Server instances. | `number` | n/a | yes |
| ascs\_ami | AWS AMI of the SAP ASCS instance. | `string` | n/a | yes |
| ascs\_hostname | Hostname of the SAP ASCS instance. | `string` | n/a | yes |
| ascs\_instance\_number | Instance Number of the SAP ASCS instance. | `number` | n/a | yes |
| ascs\_instance\_type | AWS Instance Type of the SAP ASCS instance. | `string` | n/a | yes |
| domain\_name | The already existing Route53 domain name which should be used for the full qualified hostname resolution. | `string` | n/a | yes |
| hdb\_ami | AWS AMI of the HANA Database instance. | `string` | n/a | yes |
| hdb\_hostname | Hostname of the HANA Database instance. | `string` | n/a | yes |
| hdb\_instance\_number | Instance Number of the HANA Database instance. | `number` | n/a | yes |
| hdb\_instance\_type | AWS Instance Type of the HANA Database instance. | `string` | n/a | yes |
| sap\_sid | SAP System identifier. | `string` | n/a | yes |
| ssh\_public\_key | SSH Public Key for the Instance connection. | `string` | n/a | yes |
| vpc\_id | AWS Private VPC ID | `string` | n/a | yes |

## Outputs

No output.

