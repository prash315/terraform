variable "vpcid" {
  type = string
}

module "shared_vars" {
  source = "../shared_vars"
}

resource "aws_security_group" "sg_module_creation" {
  name        = "sg_ec2_${module.shared_vars.env_suffix}"
  description = "Terraform course security group for EC2 instance"
  vpc_id      = "${var.vpcid}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22 # this is to open the ssh access usually in port 22
    to_port     = 22 # this is to open the ssh access usually in port 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 22 # this is to open the ssh access usually in port 22
    to_port         = 22 # this is to open the ssh access usually in port 22
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    # prefix_list_ids = ["pl-12c4e678"]
  }
}

output "sg_id_output" {
  value = "${aws_security_group.sg_module_creation.id}"
}
