/* Security group */
output "sg_webapp_albs_id" {
    value = "${aws_security_group.webapp_albs.id}"
}

output "sg_webapp_instances_id" {
    value = "${aws_security_group.webapp_instances.id}"
}

output "vpc_id" {
    value = "${aws_vpc.main.id}"
}

/* Subnet IDs */
output "subnet_ids" {
    value = "${join(",", aws_subnet.subnet.*.id)}"
}

output "webapp1-ecr-url" {
    value = "${aws_ecr_repository.finder-app.repository_url}"
}

output "webapp2-ecr-url" {
    value = "${aws_ecr_repository.finder-application.repository_url}"
}

output "consul-ecr-url" {
    value = "${aws_ecr_repository.consul.repository_url}"
}

output "redis-ecr-url" {
    value = "${aws_ecr_repository.redis.repository_url}"
}

