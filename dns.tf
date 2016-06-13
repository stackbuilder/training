#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#
# Your DNSimple token is:
#
#
# Your Identity is:
#
#
# Configure the DNSimple provider

variable "dnsimple_token" {
}

variable "dnsimple_email" {
}


provider "dnsimple" {
	    token = "${var.dnsimple_token}"
	    email = "${var.dnsimple_email}"
}

resource "dnsimple_record" "example" {
	domain = "terraform.rocks"
	type   = "A"
	name   = "harry"
	value  = "${aws_instance.web.0.public_ip}"
}
