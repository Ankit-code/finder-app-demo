/* Terraform constraints */
terraform {
    required_version = ">= 0.11, < 0.12"
}

variable "name_prefix" {
    default = "demo"
    description = "Name prefix for this environment."
}

variable "aws_region" {
    default = "ap-south-1"
    description = "Determine AWS region endpoint to access."
}

/* The ami for ap-south-1 is current as per ecs, please check for your region and substitue the value in corresponding key
variable "ecs_image_id" {
  default = {
    ap-northeast-1 = "ami-68ef940e"
    ap-southeast-1 = "ami-0a622c76"
    eu-west-1      = "ami-0693ed7f"
    us-east-1      = "ami-a7a242da"
    us-west-1      = "ami-9ad4dcfa"
    us-west-2      = "ami-92e06fea"
    ap-south-1     = "ami-05f009513cd58ac90"
  }
}

variable "webapp_docker_image_1_name" {
    default = "finder/webapp_docker_image_1"
    description = "Docker image from Docker Hub"
}

variable "webapp_docker_image_1_tag" {
    default = "latest"
    description = "Docker image version to pull (from tag)"
}

variable "webapp_docker_image_2_name" {
    default = "finder/webapp_docker_image_2"
    description = "Docker image from Docker Hub"
}

variable "webapp_docker_image_2_tag" {
    default = "latest"
    description = "Docker image version to pull (from tag)"
}

variable "consul_docker_image_name" {
    default = "finder/consul_docker_image"
    description = "Docker image from Docker Hub"
}

variable "consul_docker_image_tag" {
    default = "latest"
    description = "Docker image version to pull (from tag)"
}

variable "redis_docker_image_name" {
    default = "finder/redis_docker_image"
    description = "Docker image from Docker Hub"
}

variable "redis_docker_image_tag" {
    default = "latest"
    description = "Docker image version to pull (from tag)"
}

variable "count_webapp" {
    default = 1
    description = "Number of webapp tasks to run"
}

variable "desired_capacity_on_demand" {
    default = 1
    description = "Number of instance to run"
}

variable "ec2_key_name" {
    default = ""
    description = "EC2 key name to SSH to the instance, make sure that you have this key if you want to access your instance via SSH"
}

variable "ec2_public_key" {}

variable "instance_type" {
    default = "t2.micro"
    description = "EC2 instance type to use"
}

variable "minimum_healthy_percent_webapp" {
    default = 50
    description = "ECS minimum_healthy_percent configuration, set it lower than 100 to allow rolling update without adding new instances"
}

/* Consume common outputs */
variable "sg_webapp_albs_id" {}
variable "sg_webapp_instances_id" {}
variable "vpc_id" {}
variable "subnet_ids" {}

/* Consume static outputs */
variable "ecs_instance_profile" {}
variable "ecs_service_role" {}

/* Region settings for AWS provider */
provider "aws" {
    region = "${var.aws_region}"
}
