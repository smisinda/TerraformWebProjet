terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}
provider "aws" {
  region = "us-west-2"
}

resource "aws_launch_configuration" "example" {
  image_id        = "ami-08d70e59c07c61a3a"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.instance.id]

  user_data                   = <<-EOF
            #!/bin/bash
            echo "Hello, world" > index.html
            nohup busybox httpd -f -p ${var.server_port} &
            EOF

  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_autoscaling_group" "example" {
  launch_configuration = aws_launch_configuration.example.name
  vpc_zone_identifier  = data.aws_subnet_ids.default.ids
  min_size             = 2
  max_size             = 5
  tag {
    key                 = "Name"
    value               = "terraform_asg_example"
    propagate_at_launch = true
  }
  lifecycle {
    create_before_destroy = true
  }
}
data "aws_vpc" "default" {
  default = true
}
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}
resource "aws_security_group" "instance" {
  name = var.security_group_name
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
#output "public_ip" {
#  value       = aws_instance.example.public_ip
#  description = "The public IP of the instance"
#}