resource "aws_instance" "instance" {
  ami			= "${var.server-info["ami"]}"
  count 		= "${var.server-info["count"]}"
  instance_type		= "${var.server-info["instance_type"]}"
  key_name		= "${var.server-info["key_name"]}"
  user_data             = "${data.template_file.instance_user_data.*.rendered[count.index]}"
  vpc_security_group_ids = ["${split(",", var.security_groups)}"]

}

data "template_file" "instance_user_data" {
  count    		= "${var.server-info["count"]}"
  template 		= "${var.user_data}"

}
