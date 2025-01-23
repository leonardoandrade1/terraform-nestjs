resource "aws_autoscaling_group" "nestjs_asg" {
  desired_capacity    = 1
  min_size            = 1
  max_size            = 5
  vpc_zone_identifier = [for i in var.public_subnets[*] : i.id]


  launch_template {
    id      = var.launch_template.id
    version = "$Latest"
  }

  health_check_type         = "EC2"
  health_check_grace_period = 300
  force_delete              = true

  lifecycle {
    create_before_destroy = true
  }

  instance_refresh {
    strategy = "Rolling"

    preferences {
      min_healthy_percentage = 50
    }

    triggers = ["tag"]
  }

  tag {
    key                 = "Name"
    value               = "NestJS-ASG-Instance"
    propagate_at_launch = true
  }
}