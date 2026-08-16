resource "azurerm_subnet" "subnet" {
    for_each = var.subnet
    name = each.value.name
  virtual_network_name = data.azurerm_virtual_network.example.name
resource_group_name = data.azurerm_resource_group.rg.name
address_prefixes = each.value.address
}
variable "subnet"{
}
data "azurerm_resource_group" "rg"{
    name = "rupesh"
}
data "azurerm_virtual_network" "example" {
  name                = "vnet1"
  resource_group_name = "rupesh"
}