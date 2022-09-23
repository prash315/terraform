variable "amiid" {
  default = "ami-05fa00d4c63e32376"
}

module "shared_vars" {
  source = "../shared_vars"
}

#variable "sg_id" {} 

variable "sg_id" {
  default = "sg-0be1f5e01c70dfecf"
} 

/*
variable "ec2_name" {
  default = "EC2 Instance from module"
} 
*/

resource "aws_instance" "terraform_ec2_instance" {
  ami           = "${var.amiid}"
  instance_type = "t2.micro"
  key_name = "pp_terraform_course"
  vpc_security_group_ids = ["${var.sg_id}"] # replaced previous by variable "sg_id"
  
  tags = {
    Name = "EC2_Name_Instance_${module.shared_vars.env_suffix}"
  }
}
