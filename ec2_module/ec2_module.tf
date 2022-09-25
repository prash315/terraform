module "sg_module" {
  source = "../sg_module"
}

  resource "aws_instance" "terraform_ec2_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  key_name = "pp_terraform_course"
  vpc_security_group_ids = module.sg_module.sg_output # replaced previous by variable "sg_id"
  
  tags = {
    Name = "TF EC2 Instance"
  }
}
