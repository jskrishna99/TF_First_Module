provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg" {
  location = "${var.location}"
  name     = "${var.rgname}"

  tags = {
    Environment = "DevOps"
  }
}
resource "azurerm_storage_account" "storage" {
  account_replication_type = "LRS"
  account_tier             = "standard"
  location                 = "${var.location}"
  name                     = "${var.saname}"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
}
