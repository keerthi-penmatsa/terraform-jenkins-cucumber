resource "aws_security_group_rule" "instance" {
  
  type			= "ingress" 
  from_port		= "${var.server_port}"
  to_port		= "${var.server_port}"
  protocol		= "tcp"
  cidr_blocks		= "${var.sg_cidr_blocks}"
  security_group_id	= "${aws_security_group.sg.id}"
}

resource "aws_security_group_rule" "instance2" {

  type                  = "ingress"
  from_port             = "22"
  to_port               = "22"
  protocol              = "tcp"
  cidr_blocks           = "${var.sg_cidr_blocks}"
  security_group_id     = "${aws_security_group.sg.id}"
}

