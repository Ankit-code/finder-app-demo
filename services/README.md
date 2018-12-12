After performing `terraform init` and adding custom configs in terraform.tfvars, the next step is:
		
	`terraform plan`

The output will be to plan 9 resources.

After reviewing the plan, run this command:

	`terraform apply`

This will create the required infrastructure to run the app. Following this, ssh into the machine using any aws key pair on your account. After establishing an SSH connection to the ecs, follow these steps:

	`docker ps | grep finder | cut -d' ' -f1`

This will output 2 container ids, copy them and execute these 3 steps:

	`docker exec -it <container-id> /bin/sh`
	`python seed_db_with_random_places.py`
	`exit`

After applying above steps in both web containers, the steps 4 through 9 are repeated as per the local manual to verify keys and values.
