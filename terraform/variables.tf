variable "key_name" {
  default = "k3s-terraform"
}

variable "region" {
  type    = list(string)
  default = ["sa-east-1a"]
}

variable "master_count" {
  default = 1
}

variable "node_count" {
  default = 2
}

variable "ami" {
  default = "ami-0f2c5d4cfd5301fac"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "cidr" {
  type    = list(string)
  default = ["172.31.0.0/16"]
}
