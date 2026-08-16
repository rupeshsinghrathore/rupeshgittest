resource "azurerm_network_interface_security_group_association" "associatedNSG-NIC" {
  for_each = var.nic-aso
  network_interface_id      = data.azurerm_network_interface.example[each.key].id
  network_security_group_id = data.azurerm_network_security_group.example.id
}

variable "nic-aso" {
}

data "azurerm_network_interface" "example" {
  for_each = var.nic-aso
  name                = each.value.nic
  resource_group_name = "rupesh"
}
data "azurerm_network_security_group" "example" {
  name                = "nsg1"
  resource_group_name = "rupesh"
}