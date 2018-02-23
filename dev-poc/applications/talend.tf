provider "aws" {
  region = "us-east-1"
}

module "talend_job" {
  source			= "../resources/create-instance"
  server-info                   = "${var.talend_job}"
  user_data			= "${data.template_file.init.rendered}"
  security_groups               = "${module.sg_talend_job_server.sg_id}"
}

module "sg_talend_job_server" {

  source			= "../resources/sg-configure/sg-talend"
  name				= "Terraform-Example-1"
  description			= "Module is used to create security group" 
  server_port			= "8080"
  sg_cidr_blocks		= ["0.0.0.0/0"] 
  
}


data "template_file" "init" {
  template = "${file("../user_data/talend/helloworld.tpl")}"
  vars {
    server_port		= "${var.server_port}"
  }
}


#resource "aws_instance" "example2" {
#  ami = "ami-97785bed"
#  instance_type = "t2.micro"
#  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
#  key_name = "wavicletest"
#  tags {
#    Name = "terraform-example-2"
#  }
# user_data = <<-EOF
#          #!/bin/bash
#            echo "Hello, World" > index.html
#            nohup busybox httpd -f -p "${var.server_port}" &
#            EOF
#}

#resource "aws_security_group" "instance" {
#  name = "terraform-example2-instance"
#  ingress {
#    from_port = "${var.server_port}"
#    to_port = "${var.server_port}"
#    protocol = "tcp"
#    cidr_blocks = ["0.0.0.0/0"]
#  }
#}

#output "public_ip" {
#  value = "${aws_instance.example2.public_ip}"
#}

