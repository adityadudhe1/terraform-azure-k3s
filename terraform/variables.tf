variable "vnet_name" {
  type    = string
  default = "vnet-k3s"
}

variable "subnet_name" {
  type    = string
  default = "subnet-k3s"
}

variable "vnet_cidr" {
  type    = list(string)
  default = ["10.0.0.0/16"]
}

variable "subnet_cidr" {
  type    = list(string)
  default = ["10.0.1.0/24"]
}
