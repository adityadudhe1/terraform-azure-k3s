terraform {
  cloud {
    organization = "adityadudhe1"

    workspaces {
      name = "terraform-azure-k3s"
    }
  }

  required_version = ">= 1.5.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
