After performing `terraform init` and adding custom configs in terraform.tfvars, the next step is:
		
	`terraform plan`

The output will be to plan 5 resources (1 instance profile, 2 roles, 2 policies)

After reviewing the plan, run this command:

	`terraform apply`

The output will be the name of ecs service role and the arn of the instance profile. Note these values, as they will be supplied in services folder configurations. After completion of resource creation, proceed to network folder.
