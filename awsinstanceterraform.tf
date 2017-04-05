provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.aws_region}"
}



resource "aws_instance" "jenkins" {
  ami = "${lookup(var.aws_amis, var.aws_region)}"
  instance_type = "t2.micro"
  user_data       = "${file("userdata.sh")}"
  key_name = "terraformkey"
  tags {
    Name = "HelloWorld"
  }
}