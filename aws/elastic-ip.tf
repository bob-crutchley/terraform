resource "aws_eip" "default" {
  instance = "${aws_instance.default.id}"
  vpc = true
}
