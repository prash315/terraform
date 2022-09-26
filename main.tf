provider "aws" {
  default_tags {
    tags = {
      hashicorp-learn = "circleci"
    }
  }
}

variable "ami_id" {
  type = string
  default = ""
}

variable "vpc_id" {
  type = string
  default = ""
}

module "sg_module" {
  source = "./sg_module"
}

module "ec2_module_1" {
  source = "./ec2_module"
}

output "envSpecificOutputVariable" {
  value = "New Instance"
}
