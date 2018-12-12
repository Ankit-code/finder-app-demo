resource "aws_ecs_task_definition" "webapp" {
    family = "webapp" 
    container_definitions = "${data.template_file.task_webapp.rendered}"

    volume {
      name = "pwd"
      host_path = "/home/ec2-user"
    }

    volume {
      name = "cwd"
      host_path = "/home/ec2-user"
    }

    lifecycle {
        create_before_destroy = true
    }
}

data "template_file" "task_webapp" {
    template= "${file("task-definitions/ecs_task_webapp.json")}"

    vars {
        webapp_docker_image_1 = "${var.webapp_docker_image_1_name}:${var.webapp_docker_image_1_tag}"
    }

    vars {
        webapp_docker_image_2 = "${var.webapp_docker_image_2_name}:${var.webapp_docker_image_2_tag}"
    }


    vars {
        consul_docker_image = "${var.consul_docker_image_name}:${var.consul_docker_image_tag}"
    }


    vars {
        redis_docker_image = "${var.redis_docker_image_name}:${var.redis_docker_image_tag}"
    }

}
