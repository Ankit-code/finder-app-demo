/* Cluster definition, which is used in autoscaling.tf */
resource "aws_ecs_cluster" "webapp_cluster" {
    name = "${var.name_prefix}_webapp_cluster"
}

