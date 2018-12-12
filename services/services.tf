resource "aws_ecs_service" "webapp_service" {
    name = "${var.name_prefix}_webapp_service"
    cluster = "${aws_ecs_cluster.webapp_cluster.id}"
    task_definition = "${aws_ecs_task_definition.webapp.arn}"
    desired_count = "${var.count_webapp}"
    deployment_minimum_healthy_percent = "${var.minimum_healthy_percent_webapp}"
    iam_role = "${var.ecs_service_role}"

    load_balancer {
        target_group_arn = "${aws_alb_target_group.webapp_tg.arn}"
        container_name = "webapp"
        container_port = 8000
    }

    lifecycle {
        create_before_destroy = true
    }
}
