/**
  * DNS name from ALB
  * In production, you can add this DNS Name to Route 53 (your domain)
  */
output "webapp_alb_dns_name" {
    value = "${aws_alb.finder.dns_name}"
}

output "ecs_cluster_name" {
    value = "${var.name_prefix}_webapp_cluster"
}

output "alb-taregt-arn" {
    value = "${aws_alb_target_group.webapp_tg.arn}"
}
