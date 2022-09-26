provider "aws" {
  default_tags {
    tags = {
      hashicorp-learn = "circleci"
    }
  }
}

module "sg_module" {
  source = "./sg_module"
  vpc_id = var.vpc_id 

}

module "ec2_module_1" {
  source = "./ec2_module"
  ami_id = var.ami_id 
}

output "envSpecificOutputVariable" {
  value = "New Instance"
}
