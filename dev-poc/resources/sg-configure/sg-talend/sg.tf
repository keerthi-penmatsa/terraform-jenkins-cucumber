resource "aws_security_group" "sg" {
  name        = "${var.name}"
  description = "${var.description}"
}
