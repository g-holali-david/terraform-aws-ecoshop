# Input variables for the ALB module

variable "public_subnet_ids" {
  description = "List of public subnet IDs where the ALB will be deployed"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC where the ALB and target group will be created"
  type        = string
}

variable "sg_web_id" {
  description = "Security Group ID for the ALB"
  type        = string
}
