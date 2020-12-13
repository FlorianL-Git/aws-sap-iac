#individual service policies for backup:
#https://docs.aws.amazon.com/aws-backup/latest/devguide/access-control.html
#This IAM Role and Policy Attachment enables AWS Backup to create backups for all supported resource types

resource "aws_iam_role" "backup" {
  name               = "${lower(var.sap_sid)}_backup_role"
  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": ["sts:AssumeRole"],
      "Effect": "allow",
      "Principal": {
        "Service": ["backup.amazonaws.com"]
      }
    }
  ]
}
POLICY
}

#Test if Recover ARN is missing: AWSBackupServiceRolePolicyForRestores
resource "aws_iam_role_policy_attachment" "backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.backup.name
}



#Role for the S/4 Parts (ASCS, Appserver)
resource "aws_iam_role" "s4_role" {
  name               = "${var.sap_sid}_s4_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = merge(
    local.common_tags,
    {
      Name                = "${var.sap_sid}_s4_role"
    }
  )
}

#Role for the HANA DB Server
resource "aws_iam_role" "hanadb_role" {
  name               = "${var.sap_sid}_hanadb_role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = merge(
    local.common_tags,
    {
      Name                = "${var.sap_sid}_hanadb_role"
    }
  )
}
/*SHOULD NOT BE NEEDED
resource "aws_iam_role_policy_attachment" "instance_profile_backup" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.s4_role.name
}
*/

resource "aws_iam_policy" "dataprovider" {
  name = "${var.sap_sid}-DataProviderPolicy"
  description = "Policy for the AWS Data Provider for SAP"

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "EC2:DescribeInstances",
          "cloudwatch:GetMetricStatistics",
          "EC2:DescribeVolumes"
        ],
        "Resource": "*"
      },
      {
        "Sid": "VisualEditor1",
        "Effect": "Allow",
        "Action": "s3:GetObject",
        "Resource": [
        "arn:aws:s3:::aws-sap-data-provider/config.properties"
        ]
      }
    ]
  }   
  EOF
}

resource "aws_iam_role_policy_attachment" "dataprovider_s4" {
  role       = aws_iam_role.s4_role.name
  policy_arn = aws_iam_policy.dataprovider.arn
}

resource "aws_iam_role_policy_attachment" "dataprovider_hanadb" {
  role       = aws_iam_role.hanadb_role.name
  policy_arn = aws_iam_policy.dataprovider.arn
}


resource "aws_iam_policy" "hana_backint" {
  name = "${var.sap_sid}-BackintPolicy"
  description = "Policy for the HANA backint Backups"

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor1",
        "Effect": "Allow",
        "Action": [
          "s3:GetBucketPolicyStatus",
          "s3:GetBucketLocation",
          "s3:ListBucket",
          "s3:GetBucketAcl",
          "s3:GetBucketPolicy"
        ],
        "Resource": [
          "${aws_s3_bucket.hana_backint.arn}/*",
          "${aws_s3_bucket.hana_backint.arn}"
        ]
      },
      {
        "Sid": "VisualEditor2",
        "Effect": "Allow",
        "Action": [
          "kms:Decrypt",
          "kms:GenerateDataKey"
        ],
        "Resource": "${aws_kms_key.system.arn}"
      },
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "s3:PutObjectTagging",
          "s3:PutObject",
          "s3:GetObject",
          "s3:DeleteObject"
        ],
        "Resource": "${aws_s3_bucket.hana_backint.arn}/${var.sap_sid}/*"
      }
    ]
  }   
  EOF
}

resource "aws_iam_role_policy_attachment" "hana_backint" {
  role       = aws_iam_role.hanadb_role.name
  policy_arn = aws_iam_policy.hana_backint.arn
}
