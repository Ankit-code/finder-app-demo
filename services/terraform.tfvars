##
# Change your region and desired resource prefix
##
name_prefix = "demo-finder"
aws_region = "ap-south-1"

##
# Change below region and corresponding ami for its ecs
##
ecs_image_id.ap-south-1 = "ami-05f009513cd58ac90"
count_webapp = 1
desired_capacity_on_demand = 1

instance_type = "t2.micro"
minimum_healthy_percent_webapp = 100

##
# Change the image names in the given format
##
webapp_docker_image_1_name = "<account-id>.dkr.ecr.<region>.amazonaws.com/finder-app"
webapp_docker_image_1_tag = "latest"

webapp_docker_image_2_name = "<account-id>.dkr.ecr.<region>.amazonaws.com/finder-application"
webapp_docker_image_2_tag = "latest"

consul_docker_image_name = "<account-id>.dkr.ecr.<region>.amazonaws.com/consul"
consul_docker_image_tag = "latest"

redis_docker_image_name = "<account-id>.dkr.ecr.<region>.amazonaws.com/redis"
redis_docker_image_tag = "latest"

##
# Substitute the values generated in the network folder output
##
sg_webapp_albs_id = "sg-"
sg_webapp_instances_id = "sg-"
subnet_ids = "subnet-,subnet-"
vpc_id = "vpc-"

# Network outputs, change the values as per account id and name prefix
ecs_instance_profile = "arn:aws:iam::<account-id>:instance-profile/<name_prefix>_instance_profile"
ecs_service_role = "<name_prefix>_service_role"

##
# Place the public key and key name of a key pair you have created on aws. You should possess the corresponding pem file to ssh into ecs.
##
ec2_key_name = ""
ec2_public_key = "ssh-rsa "
