provider "aws" {
  default_tags {
    tags = {
      hashicorp-learn = "circleci"
    }
  }
}

module "sg_module" {
  source = "./sg_module"
  variable vpc_id = {}

}

module "ec2_module_1" {
  source = "./ec2_module"
  variable ami_id = {}
}

output "envSpecificOutputVariable" {
  value = "New Instance"
}
