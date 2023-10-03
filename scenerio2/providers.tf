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
    token = "JSu7g4zl40SVyw.atlasv1.tpVwUyMeIWflalzS7eptIroNPTxKv3wky65kJa8hHSSQePQJDnUN3Ppw4XahnHO3hak"

    workspaces {
      name = "KPMG_2"
    }
  }
}

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  features {}
}