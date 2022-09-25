variable "ami_id" {
  type = string
}

module "shared_vars" {
  source = "../shared_vars"
}

variable "sg_id" {
  type = string
}

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "pp_terraform_course"
  vpc_security_group_ids = ["${var.sg_id}"] # replaced previous by variable "sg_id"
  
  tags = {
    Name = "EC2_Name_Instance_${module.shared_vars.env_suffix}"
  }
}
