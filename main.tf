#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#
# Your security group ID is:
#
#
# Your AMI ID is:
#
#
# Your Identity is:
#
#
# Your AccessKeyID and SecretAccessKey are:
#
#
variable aws_access_key {}
variable aws_secret_key {}
variable aws_region {
  default =  "eu-central-1"
}


provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count      = "2"
  ami        = "ami-74ee001b"
  instance_type = "t2.micro"
  subnet_id  = "subnet-99a58be2"
  vpc_security_group_ids = ["sg-8e08dfe6"]

  tags {
    Identity = "hashiconf-d3d9446802a44259755d38e6d163e820"
    name = "Harry"
    bla = "BladieBla"
  }
}
output "public_ip" { 
  value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.web.*.public_dns)}"
}

