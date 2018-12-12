/* ECR repositories to be created for containers */

resource "aws_ecr_repository" "finder-app" {
  name = "finder-app"
}

resource "aws_ecr_repository" "finder-application" {
  name = "finder-application"
}

resource "aws_ecr_repository" "consul" {
  name = "consul"
}

resource "aws_ecr_repository" "redis" {
  name = "redis"
}
