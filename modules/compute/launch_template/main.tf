resource "aws_launch_template" "nestjs_launch_template" {
  name          = "nestjs-launch-config"
  image_id      = data.aws_ami.awslinux2.image_id
  instance_type = "t2.micro"

  user_data = base64encode(var.nestjs_ec2_user_data)

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [var.security_group.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}