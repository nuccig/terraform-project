resource "azurerm_resource_group" "rs_azure" {
  name     = "resource-group-example"
  location = "West Europe"

  tags = var.tags
}

resource "azurerm_storage_account" "sa_azure" {
  name                     = "nuccigremotestoragestate"
  resource_group_name      = azurerm_resource_group.rs_azure.name
  location                 = azurerm_resource_group.rs_azure.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  blob_properties {
    versioning_enabled = true
  }

  tags = var.tags
}

resource "azurerm_storage_container" "remote_state" {
  name                  = "remote-state"
  storage_account_id    = azurerm_storage_account.sa_azure.id
  container_access_type = "private"
}
