resource "azurerm_network_interface" "nic" {
  for_each = var.nic
  name                = each.value.name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.example[each.key].id
  }
}

variable "nic"{}

data "azurerm_resource_group" "rg"{
    name = "rupesh"
}
data "azurerm_subnet" "example" {
    for_each =var.nic
  name                 = each.value.subnet-name
  virtual_network_name = "vnet1"
  resource_group_name  = data.azurerm_resource_group.rg.name
}

data "azurerm_public_ip" "example" {
    for_each =var.nic
  name                = each.value.pip-name
  resource_group_name = data.azurerm_resource_group.rg.name
}