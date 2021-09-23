resource "aws_elb" "elb" {
  name    = "terraform-elb"
  subnets = ["${aws_subnet.aws-1-subnet-public.id}", "${aws_subnet.aws-1-subnet-private.id}","${aws_subnet.aws-2-subnet-public.id}", "${aws_subnet.aws-2-subnet-private.id}"]

  listener {
    instance_port     = 8888
    instance_protocol = "http"
    lb_port           = 8888
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8888/"
    interval            = 30
  }

  instances                   = ["${aws_instance.web-1.*.id}","${aws_instance.web-2.*.id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags {
    Name = "terraform-elb"
  }
}

output "elb_instances" {
  value = ["${aws_elb.elb.instances}"]
}

output "elb_public_dns_name" {
  value = ["${aws_elb.elb.dns_name}"]
}
