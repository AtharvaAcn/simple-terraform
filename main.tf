resource "azurerm_resource_group" "rg" {
  name     = var.rg_name
  location = var.rg_location
}


resource "azurerm_storage_account" "storageAccount" {
  name                     = var.storageAccount_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"

  allow_nested_items_to_be_public = true
  public_network_access_enabled   = true

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account_static_website" "wesbite" {
  storage_account_id = azurerm_storage_account.storageAccount.id
  index_document     = "index.html"
}

resource "azurerm_storage_blob" "blobStorage" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.storageAccount.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source_content         = var.source_content
  access_tier = "Hot"
  
  depends_on = [azurerm_storage_account_static_website.wesbite]
}
