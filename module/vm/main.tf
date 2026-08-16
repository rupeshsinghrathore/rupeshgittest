resource "azurerm_linux_virtual_machine" "vm" {
  for_each = var.vm
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "adminuser"
  admin_password = "Window@1234"
  disable_password_authentication = false
  network_interface_ids     = [
    data.azurerm_network_interface.example[each.key].id,
  ]

    os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

data "azurerm_resource_group" "rg"{
    name = "rupesh"
}

data "azurerm_network_interface" "example" {
  for_each = var.vm
  name = each.value.nic
    resource_group_name = data.azurerm_resource_group.rg.name
}
variable "vm"{}