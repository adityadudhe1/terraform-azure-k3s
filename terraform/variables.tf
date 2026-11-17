variable "location" {
  type    = string
  default = "South India"
}

variable "resource_group_name" {
  type    = string
  default = "rg-k3s-demo"
}

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

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "vm_size" {
  type    = string
  default = "Standard_D2als_v6"
}

variable "master_vm_name" {
  type    = string
  default = "master01"
}

variable "worker_vm_name" {
  type    = string
  default = "worker01"
}

variable "ssh_public_key" {
  type = string
}
