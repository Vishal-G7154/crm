variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "instance_name" {}
variable "subnet_id" {
  description = "Subnet ID where the instance will be launched"
  type        = string
  default     = null
}
variable "security_group_ids" {
  description = "List of security group IDs to associate with the instance"
  type        = list(string)
  default     = []
}
