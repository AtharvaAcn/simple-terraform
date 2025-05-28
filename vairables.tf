variable "rg_name" {

}

variable "rg_location" {

}

variable "vnet_name" {

}

output "public_ip_address" {
  value = azurerm_linux_virtual_machine.vm.public_ip_address
}
