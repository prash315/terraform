provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = "/users/prashanthpalamand/.aws/credentials"
  profile                 = "pp_terraform_course"
}

module "sg_module" {
  source = "./sg_module"
}

module "ec2_module_1" {
  sg_id = "${module.sg_module.sg_id_output}"
  source = "./ec2_module"
}

locals {
  env = "${terraform.workspace}"

  amiid_env = {
    "default" = "amiid_default"
    "staging" = "amiid_staging"
    "production" = "amiid_production"
  }
  amiid = "${lookup(local.amiid_env, local.env)}"
}

output "envSpecificOutputVariable" {
  value = "${local.amiid}"
}
