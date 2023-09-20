variable "db_identifier" {
  type    = string
  default = "default_rds"
}

variable "dbname" {
  type    = string
  default = "test"
}

variable "dbengine" {
  type    = string
  default = "mysql"
}

variable "rds_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "engine_version" {
  type    = string
  default = "5.7"
}

variable "security_group_name" {
  type    = string
  default = "default_sg"
}

variable "username" {
  type    = string
  default = "admin"
}

variable "password" {
  type    = string
  default = "053b0d53c279acc90"
}