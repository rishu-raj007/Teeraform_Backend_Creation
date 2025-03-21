terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "rg-storage"
    storage_account_name = "storageaccrishu"
    container_name = "badhiyacontainer"
    key = "terraform.tfstate"
    
  }
}
provider "azurerm" {
  features {}
  subscription_id = "98174e88-da11-4352-adda-43babc341410"
}
resource "azurerm_resource_group" "storage" {
  name     = "rg-storage"
  location = "East US"

}
#storage account
resource "azurerm_storage_account" "storage1" {
  name = "storageaccrishu"
  resource_group_name = azurerm_resource_group.storage.name
  location = azurerm_resource_group.storage.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  
}
#storage container
resource "azurerm_storage_container" "container1" {
  name = "badhiyacontainer"
  storage_account_id = azurerm_storage_account.storage1.id
  # storage_account_name = azurerm_storage_account.storage1.name
  container_access_type = "blob"
  
}
# resource "azurerm_virtual_network" "vnet1" {
#   name                = "vnet1_eastus"
#   location            = azurerm_resource_group.storage.location
#   resource_group_name = azurerm_resource_group.storage.name
#   address_space       = ["192.0.0.0/29"]
#   subnet {
#     name             = "subnet1"
#     address_prefixes = ["192.0.0.0/29"]
#   }
# }
# resource "azurerm_virtual_network" "vnet2" {
#   name                = "vnet2_eastus"
#   location            = azurerm_resource_group.peering_rg.location
#   resource_group_name = azurerm_resource_group.peering_rg.name
#   address_space       = ["192.0.0.0/29"]
#   subnet {
#     name             = "subnet1"
#     address_prefixes = ["192.0.0.0/29"]
#   }
# }
