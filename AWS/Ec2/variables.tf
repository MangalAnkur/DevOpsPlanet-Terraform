variable "security_group_name" {
  type    = string
  default = "default_sg"
}

variable "key_pair_name" {
  type    = string
  default = "default_key_pair"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_name" {
  type    = string
  default = "default_instance"
}

variable "instance_ami_id" {
  type    = string
  default = "ami-053b0d53c279acc90"
}