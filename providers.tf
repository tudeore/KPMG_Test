terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "=3.0.0"
    }
  }

  backend "remote" {
    hostname = "app.terraform.io"
    organization = "TI-POC"

    workspaces {
      name = "KPMG_1"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subnet_name
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}
}