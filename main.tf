provider "aws" {
  region = var.region
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
