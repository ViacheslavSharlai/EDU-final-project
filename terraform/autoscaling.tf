
resource "aws_launch_configuration" "ec2_launch_config" {
  image_id             = data.aws_ami.amazon-linux-2.id
  iam_instance_profile = aws_iam_instance_profile.ec2-profile.name
  security_groups      = ["${aws_security_group.web.id}"]
  instance_type        = var.instance-type
  key_name             = var.key-name
}

resource "aws_autoscaling_group" "ec2_asg_blue" {
  name                      = "ec2-autoscale-blue"
  depends_on                = [aws_launch_configuration.ec2_launch_config]
  launch_configuration      = aws_launch_configuration.ec2_launch_config.name
  vpc_zone_identifier       = [aws_subnet.main-subnet-public-1.id, aws_subnet.main-subnet-public-2.id]
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
  tag {
    key                 = "blue"
    value               = "blue"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "ec2_asg_green" {
  name                      = "ec2-autoscale-green"
  depends_on                = [aws_launch_configuration.ec2_launch_config]
  launch_configuration      = aws_launch_configuration.ec2_launch_config.name
  vpc_zone_identifier       = [aws_subnet.main-subnet-public-1.id, aws_subnet.main-subnet-public-2.id]
  desired_capacity          = 2
  min_size                  = 2
  max_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "ELB"

  lifecycle {
    ignore_changes = [load_balancers, target_group_arns]
  }
  tag {
    key                 = "green"
    value               = "green"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_attachment" "asg_attachment_alb_blue" {
  autoscaling_group_name = aws_autoscaling_group.ec2_asg_blue.id
  alb_target_group_arn   = aws_alb_target_group.web-blue.arn
}

resource "aws_autoscaling_attachment" "asg_attachment_alb" {
  autoscaling_group_name = aws_autoscaling_group.ec2_asg_green.id
  alb_target_group_arn   = aws_alb_target_group.web-green.arn
}
