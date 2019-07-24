resource "aws_key_pair" "default" {
  key_name = "default-key-pair"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
