terraform {
  cloud {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4.0"
    }
  }

  required_version = ">= 1.2.0"
}

variable region {}

variable "vpc_id" {
 type        = string
 description = "VPC ID"
 default = ""
}

variable "ami_id" {
 type        = string
 description = "AMI ID for the EC2 instance"
 default = ""
}
