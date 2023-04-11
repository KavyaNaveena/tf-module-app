resource "aws_launch_template" "main" {
  name = "${var.component}-${var.env}"

  credit_specification {
    cpu_credits = "standard"
  }

#  iam_instance_profile {
#    name = "test"
#  }

  image_id = data.aws_ami.ami.id

  instance_market_options {
    market_type = "spot"
  }

  instance_type = var.instance_type

  tag_specifications {
    resource_type = "instance"

    tags = merge(
      { Name = "{var.component}-${var.env}" }
    )
  }

  // user_data = filebase64("${path.module}/example.sh")
}