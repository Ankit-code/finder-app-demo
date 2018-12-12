## Requirements

- Terraform (https://www.terraform.io/downloads.html)
- Set `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` environment variable in your local environment
- Docker-compose

## Directory structure

This project uses https://github.com/mattgathu/finder-app to deploy 2 web nodes and a redis database locally and on aws.

In this project, Terraform configuration files are divided into three main categories:
- `services`: Autoscaling groups (ASG), Application Load Balancer (ALB), ECS fall into this category
- `network`: Network architecture
- `iam`: Manage IAM roles and policies

Furthermore the folder `local-finder` contains the docker-compose file that installs the services locally. It is recommended to read the instructions provided in the folder before proceeding to Terraform. Each terraform folder has it's own README.md for specific instructions for the folder.

The Order of applying terraform in folders is:

	iam -> network -> services

Apply `terraform init` before initiating planning phase in each folder to get the required plugins.
