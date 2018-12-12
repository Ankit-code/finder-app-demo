/**
 *  IAM Profile for ASG
 *  Note: You can add other "aws_iam_role_policies" to the instance (as necessary)
 *        For example, you may want to add S3 read policy to access Docker credentials
 *        which is stored in S3 for private hub.
 */

resource "aws_iam_instance_profile" "ecs_instance_profile" {
    name = "${var.name_prefix}_ecs_instance_profile"
    role = "${aws_iam_role.ecs_instance_role.name}"
}

resource "aws_iam_role" "ecs_instance_role" {
    name = "${var.name_prefix}_ecs_instance_role"
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
}

resource "aws_iam_role_policy" "ecs_instance_role_policy" {
    name = "${var.name_prefix}_ecs_instance_role_policy"
    role = "${aws_iam_role.ecs_instance_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ecs:*",
	"ecr:*",
	"cloudtrail:LookupEvents",
	"ec2:AuthorizeSecurityGroupIngress",
	"ec2:Describe*",
	"elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
	"elasticloadbalancing:DeregisterTargets",
	"elasticloadbalancing:Describe*",
	"elasticloadbalancing:RegisterInstancesWithLoadBalancer",
	"elasticloadbalancing:RegisterTargets"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

/**
 * IAM Role for ECS Service
 */

resource "aws_iam_role" "ecs_service_role" {
    name = "${var.name_prefix}_ecs_service_role"
    assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "ecs_service_role_policy" {
    name = "${var.name_prefix}_ecs_service_role"
    role = "${aws_iam_role.ecs_service_role.id}"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "ECSTaskManagement",
      "Effect": "Allow",
      "Action": [
	"ec2:AttachNetworkInterface",
	"ec2:CreateNetworkInterface",
	"ec2:CreateNetworkInterfacePermission",
        "ec2:DeleteNetworkInterface",
	"ec2:DeleteNetworkInterfacePermission",
	"ec2:Describe*",
	"ec2:CreateTags",
	"ec2:DetachNetworkInterface",
	"elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
	"elasticloadbalancing:DeregisterTargets",
	"elasticloadbalancing:Describe*",
	"elasticloadbalancing:RegisterInstancesWithLoadBalancer",
	"elasticloadbalancing:RegisterTargets",
	"route53:ChangeResourceRecordSets",
	"route53:CreateHealthCheck",
	"route53:DeleteHealthCheck",
	"route53:Get*",
	"route53:List*",
	"route53:UpdateHealthCheck",
	"servicediscovery:DeregisterInstance",
	"servicediscovery:Get*",
	"servicediscovery:List*",
	"servicediscovery:RegisterInstance",
	"servicediscovery:UpdateInstanceCustomHealthStatus"
      ],
      "Resource": [
	"*"
      ]
    }
  ]
}
EOF
}
