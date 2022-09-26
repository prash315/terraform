variable "ami_id" {
 type        = string
 description = "AMI ID for the EC2 instance"
 default     = "ami-0d26eb3972b7f8c96"
 
 validation {
   condition     = length(var.ami_id) > 4 && substr(var.ami_id, 0, 4) == "ami-"
   error_message = "Please provide a valid value for variable AMI."
 }
}

variable "vpc_id" {
 type        = string
 description = "VPC ID"
 default     = "" 

}
