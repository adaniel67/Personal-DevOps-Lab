variable "aws_region" {
  description = "AWS region where the lab infrastructure will be deployed"
  type        = string
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "CIDR range for the lab VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR range for the public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR range for the private subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "availability_zone" {
  description = "AWS Availability Zone for the lab subnets"
  type        = string
  default     = "us-east-2a"
}

variable "environment" {
  description = "Environment name used to tag lab resources"
  type        = string
  default     = "Lab"
}