terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}


resource "aws_instance" "demo" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = var.instance_name
  }
}

variable "sg_name" {
  default = "allow_ssh_ping"
}

variable "sg_description" {
  default = "Allow SSH and ping (ICMP) inbound traffic"
}

# SSH rule
variable "ssh_description" {
  default = "SSH from anywhere"
}

variable "ssh_from_port" {
  default = 22
}

variable "ssh_to_port" {
  default = 22
}

variable "ssh_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

# ICMP rule
variable "icmp_description" {
  default = "Allow ping"
}

variable "icmp_from_port" {
  default = -1
}

variable "icmp_to_port" {
  default = -1
}

variable "icmp_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

# Egress
variable "egress_from_port" {
  default = 0
}

variable "egress_to_port" {
  default = 0
}

variable "egress_protocol" {
  default = "-1"
}

variable "egress_cidr_blocks" {
  default = ["0.0.0.0/0"]
}

# Tags
variable "sg_tag_name" {
  default = "allow-ssh-ping"
}
