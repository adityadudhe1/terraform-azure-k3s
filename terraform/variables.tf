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
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCrybhQIkGJlv3/P6X0sJTDz2I+lLep9YbH3V3Wcv/EM4j7VN4wJe9mzgwNprTPIlt8Una2GVCBT2MD5Xm9Z/zwuOqR0bvbvbMAuYUpyvXrPZCrg2InWXao+cZ/s4K+zM67BFdFid40yABOA19IW1/xdGzOJpIOaMSHuTZEEaJ57spYrcmC2rk+Ese2fzzIdgsH4pqs3qoi9PEIMCBhS8rNzukzE4yzvFTJRRXmLRnEmq3e6/D3HaS7ePRmBstKrElQTqsgNR3MtwqhOhNQwWPtVenWktx36+kEuYl4BGyL6kHhbHIAy82QxBKhlSCpEDbVRbteH7w4H2u6jwHLIN4fQ0BqnNPGwDYDU8+L5asJpGT/XAYdemMh9tSaCuvj2t167GPtRS+SfTriJHVf8itdPOrJHgdG/MkYvzN1WmhNkndPKoANkl7MCsA/uHNLIcKKKXgMoN9Tq1SfgwwCJ52wKNrD3DvX6yslSDm1p1Oot+7mpsOX/AAIIBcsY4XgrkhzKCbrm17JB0N9G1MY3STkWlUhgLXB3plTI41W7qIMnY+UtJay3ZgxtkWWw7In0N/TB7TjebmZxHQWyYbm1556OTtmCk7C6XTtGnQzCotnF9lfM5XVgGGJVHmlU996x0feMTB3dkpahtPui+w7uuQQO+z8qaTy7w8SIpNWMmRn1w== aditya@SandboxHost-639305046327207643"
}
