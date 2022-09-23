locals {
  env = "${terraform.workspace}"

  env_suffix_env = {
    "default" = "amiid_default"
    "staging" = "amiid_staging"
    "production" = "amiid_production"
  }
  env_suffix  = "${lookup(local.env_suffix_env, local.env)}"
}

output "env_suffix" {
  value = "${local.env_suffix}"
}
