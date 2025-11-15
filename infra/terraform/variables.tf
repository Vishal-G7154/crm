variable "aws_region" {
  default = "ap-south-1"
}

variable "aws_profile" {
  description = "AWS CLI profile name to use for authentication"
  type        = string
  default     = "default"
}

variable "ami_id" {
  default = "ami-02b8269d5e85954ef"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "key_name" {
  description = "Existing AWS keypair name for SSH access"
}

variable "instance_name" {
  default = "client1-crm-dev-ec2-01"
}

