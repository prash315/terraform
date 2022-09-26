variable "vpc_id" {
 type        = string
 description = "VPC ID"
 default = ""
}

variable "ami_id" {
 type        = string
 description = "AMI ID for the EC2 instance"
 default = var.ami_id
}
