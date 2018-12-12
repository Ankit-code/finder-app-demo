After performing `terraform init` and adding custom configs in terraform.tfvars, the next step is:
		
	`terraform plan`

The output will be to plan 18 resources.

After inspecting the plan, run this command:

	`terraform apply`

The output will be the name of ecr repositories, the VPC id and the security group IDs for LBs and instances. Note these values, as they will be supplied in services folder configurations. After completion of resource creation, proceed to services folder.

After these steps are complete, cd to local-finder directory and run this command:

	`bash run.sh <account-id-aws>.dkr.ecr.<region>.amazonaws.com`

This will build all the required images and push to all repos created by ecr.tf . Ensure this step is complete before proceeding to services.
