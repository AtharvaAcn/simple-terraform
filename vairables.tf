variable "rg_location" {
  type = string
}

variable "rg_name" {
  type = string
}

variable "storageAccount_name" {
  type = string
}

variable "index_document" {
  type = string
}

variable "source_content" {
  type = string
}

output "website_url" {
  value = azurerm_storage_blob.blobStorage.url
}